---
title: UNIX and Unix-Like File Systems
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-UNIX-systems.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

UNIX is a family of computer operating systems that meet a set of criteria
(some examples include Apple’s macOS and Oracle Solaris).
Unix-like systems are computer systems that behave similarly to UNIX,
without necessarily meeting the Single UNIX Specification.
Linux operating systems are Unix-like systems, and may be known as GNU/Linux,
due to being a GNU derivative.
Linux distributions (i.e. CentOS, Ubuntu, Debian, Fedora, Red Hat, Mint...
there are a lot) are free and open-source, and all follow a similar layout in
how they are set-up.

# Root Directory {#root}

The root directory is the penultimate directory on a Unix system, and can be
accessed through `cd /`.
The root directory is set up in a way so that only the administrator(s)
(known as the "root user(s)" can make changes in this directory.
This is a safety issue--just messing around with any old file or directory
without knowing the purpose can royally screw up the system, since these files
describe the operating system itself.

# Bin Directories {#bin}

The bin directories usually hold programs.
The root bin directory can be accessed through `cd /bin`.
If you do that in a Terminal, and then use the [ls](UNIXguide-ls.html)
command, you will list a bunch of different programs.
You'll even find stuff like [ls](UNIXguide-ls.html)!
That's because commands are programs that are accessed to do their intended
purpose.
Additional bin directories are:
```bash
/bin/
/usr/bin/
/usr/local/bin/
/sbin/
```

# Home Directory {#home}

The home directory is your safe place.
It's essentially your owner folder on the computer, which is where you'll
create all of your personal files and folders from.
You can access your home directory at any time using the
[cd](UNIXguide-cd.html) command.
The home directory typically has a path of `/home/username/` which is equal
to `~/` to the computer.
Hence, anytime you're away from the confines of your own home directory
(like when copying files between computers), to navigate back to it, you'll
need to remember the tilde.
Home directories are automatically created when a new user is added to the
computer.

# Scratch Directory {#scratch}

The scratch directory is usually given the largest disk partition on a
computer, meaning it has the biggest space allocation.
While home directory creation is automatic, scratch directories need to be
created by the user.
To create your own, use: `$ mkdir /scratch/username`.

It is possible that you need to be a root user to create your own personal
scratch directory.
If you're a root user, you can do this with [sudo](UNIXguide-sudo.html).
If you are not, then ask an administrator for help.

# Graphical User Interface {#GUI}

Remember how I talked about the command line?
Well, if you've ever used a computer like a normal person, then you've had a
nice visual component that enabled you to never think about the command line
before.
That visual component is known as the Graphical User Interface, or GUI.
Some programs only function via a GUI, or perform best through a GUI.
That's why when you're remotely connecting to computers, you may encounter
times that you need to set up stuff like graphical forwarding (known as X11).
X11 allows you to see the user interface that you're remotely accessing on your
own screen, and interact with it (albeit slowly).
Using the GUI is likely more intuitive while sitting at the physical computer
(since it's designed that way), so there are likely a large number of commands
that will be easier through the GUI than the command line (such as copying
  files between folders).
Those commands become important, however, when you cannot physically access
the computer.

{% include links.html %}
