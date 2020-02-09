#!/bin/bash
set -eux

# Partitioning using GNU parted
# ref. https://wiki.archlinux.jp/index.php/GNU_Parted
parted /dev/nvme0n1 \
  -s mklabel gpt \
  -s mkpart ESP fat32 1MiB 551MiB \
  -s set 1 esp on \
  -s set 1 boot on \
  -s mkpart primary ext4 551MiB 100%

mkfs.fat -F32 /dev/nvme0n1p1
mkfs.ext4 -F /dev/nvme0n1p2

mount /dev/nvme0n1p2 /mnt
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot

# Update system clock
timedatectl set-ntp true

# Select nearer mirror lists
mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
cat <<EOS >/etc/pacman.d/mirrorlist
## Japan
Server = http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/\$repo/os/\$arch
Server = http://mirrors.cat.net/archlinux/\$repo/os/\$arch
Server = http://ftp.jaist.ac.jp/pub/Linux/ArchLinux/\$repo/os/\$arch
EOS

# Install base systems
pacstrap /mnt base base-devel linux linux-firmware git zsh vim openssh grub efibootmgr networkmanager
genfstab -U /mnt >>/mnt/etc/fstab

# chroot
cat <<EOS >/mnt/root/setup.sh
#!/bin/bash
set -eux

## hostname
echo T480s > /etc/hostname

## timezone
ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
hwclock --systohc --utc

## locale
export LANG=en_US.UTF-8

mv /etc/locale.gen /etc/locale.gen.bak
echo \$LANG UTF-8 >> /etc/locale.gen
echo ja_JP.UTF-8 UTF-8 >> /etc/locale.gen
locale-gen

echo LANG=\$LANG > /etc/locale.conf

## Network
systemctl enable NetworkManager

## Initramfs
mkinitcpio -p linux

## Bootloader
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub --recheck
grub-mkconfig -o /boot/grub/grub.cfg

cp /etc/default/grub /etc/default/grub.bak
sed -i -e "s/#GRUB_SAVEDEFAULT/GRUB_SAVEDEFAULT/" -e "s/GRUB_DEFAULT=0/GRUB_DEFAULT=saved/" -e "s/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/" /etc/default/grub

## For VirtualBox
mkdir -p /boot/EFI/boot
cp /boot/EFI/grub/grubx64.efi /boot/EFI/boot/bootx64.efi

## Root password
passwd

## Create user
useradd -m -G wheel -s /usr/bin/zsh cheezenaan
passwd cheezenaan

echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
passwd -l root

## Cleanup
pacman -Syu --noconfirm
EOS

chmod +x /mnt/root/setup.sh
arch-chroot /mnt /root/setup.sh

# Cleanup
rm /mnt/root/setup.sh
umount -R /mnt
