# archlinux

```bash
pacstrap /mnt base linux linux-firmware base-devel nano
```

```bash
EDITOR=nano visudo
# Uncomment this line
# %wheel ALL=(ALL) ALL
```

```bash
usermod -m -G wheel <username>
passwd <username>
```

```bash
pacman -S xdg-user-dirs
```