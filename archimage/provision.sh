#!/bin/bash

echo -n "User password: "
read -rs USERPASS
echo

echo -n "Hostname: "
read -r NEWHOSTNAME

PROVISION=$(mktemp)
cat > "${PROVISION}" << EOF
  #!/bin/bash

  # Remove root password
  passwd -l root

  # Set time zone
  ln -sf /usr/share/zoneinfo/Europe/Stockholm /etc/localtime
  hwclock --systohc

  # Update locale
  TMPFILE=$(mktemp)
  cat /etc/locale.gen | sed 's/^#en_US.UTF-8/en_US.UTF-8/g' > \${TMPFILE}
  mv \${TMPFILE} /etc/locale.gen
  locale-gen
  echo "LANG=en_US.UTF-8" > /etc/locale.conf

  # Set hostname
  echo "${NEWHOSTNAME}" > /etc/hostname

  # Update pacman
  pacman -Suy

  # Install packages
  pacman -S --needed --noconfirm - < /packages
  rm -f /packages

  # Create user
  useradd -m -s "/usr/bin/zsh" "${USER}"
  echo "${USER}:${USERPASS}" | chpasswd
  echo "${USER} ALL=(ALL:ALL) ALL" > /etc/sudoers.d/"${USER}"

  # Enable dhcpcd service
  systemctl enable dhcpcd
  systemctl enable gdm

  # Mount bigdrive
  echo "/dev/sda2 /mnt/bigdrive auto nosuid,nodev,nofail,x-gvfs-show,uid=1000,gid=1000 0 0" > /etc/fstab

  # Configure LIBVA_DRIVER
  echo "LIBVA_DRIVER_NAME=\"vdpau\"" >> /etc/environment
  echo "VDPAU_DRIVER=\"nvidia\"" >> /etc/environment

  # Create initcpio image
  mkinitcpio -P
EOF

USERSCRIPT=$(mktemp)
cat > "${USERSCRIPT}" << EOF
  #!/bin/bash

  cd "${HOME}"

  # Generate SSH key
  mkdir -p "${HOME}/.ssh"
  chmod 700 "${HOME}/.ssh"
  ssh-keygen -f "${HOME}/.ssh/id_rsa" -N '' -t rsa -b 4096

  # Install yay
  mkdir -p src
  pushd src
  git clone https://aur.archlinux.org/yay.git
  popd

  # Install nvm and node lts
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm install --lts
  nvm use --lts

  # Install rvm and ruby
  curl -L get.rvm.io > rvm-install
  bash < ./rvm-install
  rm -f ./rvm-install

  # Finally - output SSH key
  echo
  echo
  echo
  echo "User SSH key"
  echo
  echo
  cat "${HOME}/.ssh/id_rsa.pub"
EOF

unset USERPASS
sudo mv "${PROVISION}" /mnt/arch/provision.sh
sudo mv "${USERSCRIPT}" /mnt/arch/userscript.sh
sudo cp ./archimage/packages /mnt/arch/packages
sudo cp ./archimage/premount_hook /mnt/arch/usr/lib/initcpio/hooks/premount
sudo cp ./archimage/premount_install /mnt/arch/usr/lib/initcpio/install/premount
sudo cp ./archimage/mkinitcpio.conf /mnt/arch/etc/mkinitcpio.conf
sudo mkdir -p /mnt/arch/etc/pacman.d/hooks
sudo cp ./archimage/nvidia.hook /mnt/arch/etc/pacman.d/hooks/nvidia.hook

sudo arch-chroot /mnt/arch << EOT
  chmod +x /provision.sh
  chmod +x /userscript.sh

  /provision.sh
  rm -f /provision.sh

  su -c /userscript.sh - mio
  rm -f /userscript.sh
EOT
