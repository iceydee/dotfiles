#!/bin/bash

echo -n "User password: "
read -rs USERPASS
echo

echo -n "Hostname: "
read -r NEWHOSTNAME

PROVISION=$(mktemp)
cat > "${PROVISION}" << EOF
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
  useradd -m \"${USER}\" -s \"/usr/bin/zsh\"
  echo \"${USER}:${USERPASS}\" | chpasswd
  echo "${USER} ALL=(ALL:ALL) ALL" > /etc/sudoers.d/"${USER}"

  # Install yay
  mkdir -p /home/${USER}/src
  cd /home/${USER}/src
  git clone https://aur.archlinux.org/yay.git

  # Enable dhcpcd service
  systemctl enable dhcpcd
  systemctl enable gdm

  # Mount bigdrive
  echo \"/dev/sda2 /mnt/bigdrive auto nosuid,nodev,nofail,x-gvfs-show,uid=1000,gid=1000 0 0\" > /etc/fstab

  # Create initcpio image
  mkinitcpio -P
EOF

unset ROOTPASS
sudo mv "${PROVISION}" /mnt/arch/provision.sh
sudo cp ./packages /mnt/arch/packages
sudo cp ./premount_hook /mnt/arch/usr/lib/initcpio/hooks/premount
sudo cp ./premount_install /mnt/arch/usr/lib/initcpio/install/premount
sudo cp ./mkinitcpio.conf /mnt/arch/etc/mkinitcpio.conf
sudo mkdir -p /mnt/arch/etc/pacman.d/hooks
sudo cp ./nvidia.hook /mnt/arch/etc/pacman.d/hooks/nvidia.hook

sudo arch-chroot /mnt/arch << EOT
  chmod +x /provision.sh
  /provision.sh
  rm -f /provision.sh
EOT
