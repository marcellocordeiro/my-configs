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
useradd -m -G wheel <username>
passwd <username>
```
