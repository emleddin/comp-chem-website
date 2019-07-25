---
title: mount
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-mount.html
folder: UNIX_guide
---

The `mount` command is used to attach the file directory of a device to the
Linux operating system's directory tree.
Using the generic `mount` will list all of the mounted devices, which is
helpful if you need to rename a device (we'll get to that in a little bit).

Actually mounting devices (outside of "plug it in") requires an administrator,
and can be done through something like
```bash
$ sudo mount /dev/sda1 /mnt
```
This will mount it to the `/mnt` folder.
Unmounting devices is done through something either of
```bash
$ sudo unmount /mnt
$ sudo unmount /dev/sda1
```
Mount also has a `--move` flag, which displays information in a different place.
```bash
$ sudo mount --move /mnt/Files/Research /home/user/Research
```

Just plugging in devices assigns them a `/dev` name.
The device's visible name (ex: Mike_USB_2012) would be found in the file system
from the `/media/username` folder.

{% include note.html content="Mac likes to put devices in `/Volumes`." %}

Each user's media folder is automatically created when they plug in a device.

Now, mounted devices are formatted different ways.
To change their assigned name, you'll need to know their formatting type.
To change their formatting upon use (which will wipe the device), the easiest
way is to do it through the [GUI](UNIXguide-UNIX-systems.html#GUI), by
right-clicking the name and choosing `Format`.
A list of formatting types is shown in the
[table below](UNIXguide-mount.html#table).

# Table: List of device formatting types {#table}

| Type | Description |
|------|-------------|
| NTFS | "New Technology File System" -- the default for modern Windows-compatible external hard drives. The only limit is the size of the drive, so you could have a single file taking up the entire memory of the external device. Unfortunately, NTFS is read-only for Mac and some Linux distributions. |
| FAT32 | "File Allocation Table" -- the oldest file system in computing. Remember floppy discs?  They're worth a Google if you don't. FAT32 allows files up to 4GB in size, so you can see why you wouldn't want this for an external. |
| exFAT | A FAT32 derivative. Ever used a digital camera? This is the common default for memory cards. The issue with it is that since it's proprietary, Microsoft limits its usage by license obligations. |
| ext2, ext3, and ext4 | "Second/Third/Fourth Extended Filesystem" -- built for compatibility with the Linux kernel. It's the default for several Linux distributions. The system lacks a journal and is ideal for SD cards and USB flash drives on Linux systems. |
| HFS+ | "Hierarchical File System +" -- this is the Mac OS Extended format. As you can probably guess, it's what Mac's use. When you use an external device on a Mac, 9/10 times it needs to be wiped and reformatted to this format. |


NTFS is likely the default formatting type.
Each formatting type has a different command to rename a mounted device.
For NTFS, that command would follow:
```bash
$ sudo ntfslabel /dev/sda1 new_name_of_device
```
where `/dev/sda1` is the device tag associated with the device, found through
the standalone `mount` command.
The device will need to be unmounted to change its name though, which can be
done either using `unmount` or through clicking the up-arrow-esque eject button
from the directory window.

For FAT32, the command would be (including the two colons):
```bash
$ sudo mlabel -i /dev/sda1 ::new_name_of_device
```

For ext2/ext3/ext4, the command would be:
```bash
$ sudo e2label /dev/sda1 new_name_of_device
```

{% include links.html %}
