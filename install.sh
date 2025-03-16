#!/bin/bash

# Set variables
DISK="/dev/sda"
HOSTNAME="archrox"
USERNAME="root"
PASSWORD="root"

# Partitioning (BIOS + MBR example, change for UEFI)
echo "Creating partitions..."
parted ${DISK} mklabel gpt
parted ${DISK} mkpart primary 1MiB 512MiB
parted ${DISK} set 1 boot on
parted ${DISK} mkpart primary linux-swap 512MiB 2GiB
parted ${DISK} mkpart primary ext4 2GiB 100%

# Formatting
mkfs.fat -F32 ${DISK}1
mkswap ${DISK}2
swapon ${DISK}2
mkfs.ext4 ${DISK}3

# Mounting
mount ${DISK}3 /mnt
mkdir /mnt/boot
mount ${DISK}1 /mnt/boot

# Install base system
pacstrap /mnt base linux linux-firmware

# Generate fstab
genfstab -U /mnt >> /mnt/etc/fstab

#Set mirrorlist
reflector --country France --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# Chroot into new system and configure it
arch-chroot /mnt 

ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc

echo "archyrox" | sudo tee /etc/hostname
sh -c 'echo "127.0.0.1  localhost" > /etc/hosts'
sh -c 'echo "127.0.1.1   archyrox" >> /etc/hosts'
sh -c 'echo "::1          localhost" >> /etc/hosts'
echo "root:$PASSWORD" | chpasswd

mkinitcpio -P

# Bootloader
pacman -Sy --noconfirm grub efibootmgr nano reflector
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
EOF

touch /etc/systemd/network/20-wired.network
cat "[Match]" >> /etc/systemd/network/20-wired.network
cat "Name=enp0s1" >> etc/systemd/network/20-wired.network
cat  "" >> etc/systemd/network/20-wired.network
cat "[Network]" >> /etc/systemd/network/20-wired.network
cat "DHCP=yes" >> etc/systemd/network/20-wired.network

systemctl enable systemd-networkd
systemctl enable systemd-resolved

ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf

localectl set-keymap --no-convert mac-fr

# Unmount and reboot
umount -R /mnt
swapoff -a
echo "Installation complete. Reboot now."
