---
title: "Aliases: for Efficiency and Laziness"
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-aliases.html
folder: UNIX_guide
---

Aliases are a powerful tool for the forgetful, the lazy, and the efficient.
They take commands that you commonly use and shorten them to a specified
command.
They are created in hidden files, which are titled with a `.` due to the
difficulty to delete them. In your home directory (`cd`), list everything
(`ls -a`) to show the hidden files.
There is likely something titled `.bash_profile` or `.bash_aliases`.
If so, open it with [vi](UNIXguide-vi.html).
If not, use `vi .bash_aliases` to create one.
[Note: if you're not using a bash shell, look for a similar file for the shell
you are using.]

The easiest way to explain the alias, is by giving an example alias.
Say you want to make it easy to ssh to a computer.
You want to just type `comp`.
In this case, make a line in the "." file (make sure to do it after the
    `#alias` line if there is one!) that looks like:
```bash
alias comp='ssh euid123@talon3.hpc.unt.edu'
```
and save by using `:.wq`.

Every time you update a `.bash` file, you need to tell the computer that you
changed something.
You can do this in a few ways.
The annoyingly long way would be to restart your computer.
Surely you can imagine why that would not be ideal.
The easy way is to `source` the file.
Basically your computer is like "OH, THAT'S NEW!"
The following example will demonstrate that.
```bash
$ source ~/.bash_profile
```
You might be thinking to yourself, "Why is there a tilde?" In which case,
I direct you to the section on
[home directories](UNIXguide-UNIX-systems.html#home).

{% include links.html %}
