# Configure after bootstrap Arch Linux

## Network

```
nmcli dev wifi connect <SSID> password <password>
```

## AUR helper

```
mkdir -p ~/src/aur.archlinux.org; cd ~/src/aur.archlinux.org
git clone https://aur.archlinux.org/yay.git yay; cd yay
makepkg -is
```

## Microcode

Install package and then regenerate the GRUB config.

```
pacman -S intel-ucode
grub-mkconfig -o /boot/grub/grub.cfg
```

## TLP

```
pacman -S tlp
tlp start
```

## Cope with thermal throtling(For ThinkPad T480s)

```
yay -S throttled
systemctl enable --now lenovo_fix
```
