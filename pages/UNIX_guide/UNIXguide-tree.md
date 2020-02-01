---
title: tree
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-tree.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

The `tree` command will list out directory contents in a tree format.
```bash
euid123@computer:~$ tree VirtualBox_VMs/
VirtualBox_VMs/
└── Ubuntu_64_1804
    ├── Logs
    │   ├── VBox.log
    │   ├── VBox.log.1
    │   └── VBox.log.2
    ├── Snapshots
    │   ├── 2020-02-12T12-00-12-123456000Z.sav
    │   └── {123ab123-1234-1a2b-aba1-cd12aa12a1bc}.vdi
    ├── Ubuntu_64_1804.vbox
    ├── Ubuntu_64_1804.vbox-prev
    └── Ubuntu_64_1804.vdi

3 directories, 8 files
```

{% include note.html content="You don't need to specify a folder with the
tree command. Here, `VirtualBox_VMs/` was specified from a home folder where
the regular result would have just cluttered this page!" %}

Different flags can be used to give more information, or only show specific
things in tree. By default, all files and subdirectories are shown.

The `-d` flag limits the result to just directory names. Depending on where
you do this command from, there can still be a lot of directories returned!
```bash
euid123@computer:~$ tree -d VirtualBox_VMs/
VirtualBox_VMs/
└── Ubuntu_64_1804
    ├── Logs
    └── Snapshots

3 directories
```

You can use the `-L` flag to limit your search to a specific "level" or depth.
After the flag, you specify how many levels you want to show (2 are selected
here).
```bash
euid123@computer:~$ tree -L 2 VirtualBox_VMs/
VirtualBox_VMs/
└── Ubuntu_64_1804
    ├── Logs
    ├── Snapshots
    ├── Ubuntu_64_1804.vbox
    ├── Ubuntu_64_1804.vbox-prev
    └── Ubuntu_64_1804.vdi

3 directories, 3 files
```

Using `-h` will print file sizes in human-readable format.
```bash
euid123@computer:~$ tree -h VirtualBox_VMs/
VirtualBox_VMs/
└── [ 224]  Ubuntu_64_1804
    ├── [ 160]  Logs
    │   ├── [151K]  VBox.log
    │   ├── [150K]  VBox.log.1
    │   └── [132K]  VBox.log.2
    ├── [ 128]  Snapshots
    │   ├── [654M]  2020-02-12T12-00-12-123456000Z.sav
    │   └── [ 49M]  {123ab123-1234-1a2b-aba1-cd12aa12a1bc}.vdi
    ├── [7.5K]  Ubuntu_64_1804.vbox
    ├── [9.2K]  Ubuntu_64_1804.vbox-prev
    └── [6.0G]  Ubuntu_64_1804.vdi

3 directories, 8 files
```

You can use the `-P` option to search for patterns, thus filtering your results.
```bash
euid123@computer:~$ tree -P Ubuntu* VirtualBox_VMs/
VirtualBox_VMs/
└── Ubuntu_64_1804
    ├── Logs
    ├── Snapshots
    ├── Ubuntu_64_1804.vbox
    ├── Ubuntu_64_1804.vbox-prev
    └── Ubuntu_64_1804.vdi

3 directories, 3 files
```

If you need the full paths to the folder, you can add the `-f` flag.
```bash
euid123@computer:~$ tree -f VirtualBox_VMs/
VirtualBox_VMs
└── VirtualBox_VMs/Ubuntu_64_1804
    ├── VirtualBox_VMs/Ubuntu_64_1804/Logs
    │   ├── VirtualBox_VMs/Ubuntu_64_1804/Logs/VBox.log
    │   ├── VirtualBox_VMs/Ubuntu_64_1804/Logs/VBox.log.1
    │   └── VirtualBox_VMs/Ubuntu_64_1804/Logs/VBox.log.2
    ├── VirtualBox_VMs/Ubuntu_64_1804/Snapshots
    │   ├── VirtualBox_VMs/Ubuntu_64_1804/Snapshots/2020-02-12T12-00-12-123456000Z.sav
    │   └── VirtualBox_VMs/Ubuntu_64_1804/Snapshots/{123ab123-1234-1a2b-aba1-cd12aa12a1bc}.vdi
    ├── VirtualBox_VMs/Ubuntu_64_1804/Ubuntu_64_1804.vbox
    ├── VirtualBox_VMs/Ubuntu_64_1804/Ubuntu_64_1804.vbox-prev
    └── VirtualBox_VMs/Ubuntu_64_1804/Ubuntu_64_1804.vdi

3 directories, 8 files
```

If you want to save the tree structure to a file, you can specify the `-o` flag.
```bash
$ tree -f VirtualBox_VMs/ -o virtual_box_tree.txt
```

{% include links.html %}
