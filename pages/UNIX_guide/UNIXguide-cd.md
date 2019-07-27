---
title: cd
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-cd.html
folder: UNIX_guide
summary: "If you've ever decided to organize, ever, then you've probably thought
of putting things in folders. Computers are no different, except their folder
system is called a directory tree. Each folder is known as a directory."
---

<link rel="stylesheet" href="css/theme-blue.css">

One of the most important commands created is `cd` which stands for
"change directory."
Basically, if I'm in folder `A`, but want to be in `Folder_17` inside of it,
then I would use
```bash
A$ cd Folder_17/
```
If you were going through multiple directories, you would need some slashes.
Slashes are important, because they signal the need to sift through a few
directories to get to where you want to go.
A specific example of this is:
```bash
$ cd /storage/scratch/share/insert_PI_here_group/
```
A slash after cd but before the location signifies that the computer has to
backtrack a little bit (i.e. get away from your home directory), and a slash
at the end of the command signifies the end of the folder name.
The very final slash isn't crucial to the success of the command.
Unix is very helpful, in that it will tell you when it can't find what you
tried to make it find with an error appearing similar to:
```bash
-bash: cd: storage/scratch/share/insert_PI_here_group/: No such file or directory
```
which allows you check yourself and retry.
Instead of retyping everything you just did (because computer people are lazy,
    and commands can be overly long), just hit the up arrow key.
A log of every command you've typed is available in the hidden trenches of your
computer, so you can scroll through all of them with the up and down arrow keys.
Additionally, if you're typing a name of something located in that folder (or
    following that path), you can hit the tab key to auto-fill the word
    you're trying for.
However, if you have two files, one named `CrazyPantsA.txt` and the other named
`CrazyTownA.txt` then tab will finish filling in `Crazy`, require you to type
a `P` or `T`, and then a second tab will finish the title.

`cd` can also be used to go back to the previous directory (like if you went
    one folder too far).
This is achieved through `cd ..`.
To backup multiple directories, you add `/..` for each additional jump to make.
If I was in folder `D`, I would use the following to return to folder `A`.
```bash
$ cd ../../../
```
Similarly, using `cd -` will take you back to the previous directory.
```bash
~ $ cd 82/98/27
27 $ cd ~/ab/ef/gh
gh $ cd -
27 $
```

{% include links.html %}
