#!/bin/bash

echo -n "Root password: "
read -rs ROOTPASS
echo

echo -n "Hostname: "
read -r NEWHOSTNAME

PROVISION=$(mktemp)
cat > "${PROVISION}" << EOF
  # Set root password
  echo "root:${ROOTPASS}" | chpasswd
  unset ROOTPASS

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

  # Enable dhcpcd service
  systemctl enable dhcpcd
EOF

unset ROOTPASS
sudo mv "${PROVISION}" /mnt/arch/provision.sh
sudo cp ./packages /mnt/arch/packages

sudo arch-chroot /mnt/arch << EOT
  chmod +x /provision.sh
  /provision.sh
  rm -f /provision.sh
EOT
