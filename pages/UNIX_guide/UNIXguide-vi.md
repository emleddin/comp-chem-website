---
title: vi editor
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-vi.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

The `vi` editor is a "VIsual" text editor.
To open something named `fake_document.txt` in this editor, use
```bash
$ vi fake_document.txt
```
This editor can also be used to create new files.
In place of the name of a current file, use a new name you would like the file
to be named.
To insert text/numbers/commands within the editor, type `i` to bring up
"insert" mode.
To quit `vi`, there are two options.
The first is to quit with saving.
For this option, hit escape before typing `:wq`, meaning "write quit."
The second is to quit without saving.
For this option, hit escape before typing `:q!`, meaning "quit."
Additionally, to save without quitting, you can use `:w`.
There are other modes, such as replace, macros, and visual, which you can
research on your own.

The "undo" button is not [cntrl+Z](UNIXguide-cntrl-z.html), since that has
already been taken for suspense (ha).
Instead, undo is `:u`.
Practically, this is `Shift+;+u`, since colon is an uppercase symbol.

Another useful feature from within the visual editor is `Shift+G`.
[Note: The + stands for "and" here.]
This will bring you to the end of the file you're viewing.
Practically, hit escape before typing `:+Shift+G`, which will leave whatever
mode you've entered before bringing you to the end.
Additionally, to move through the file in vi, several letters can be used in
place of arrow keys.
These are `H` (left), `J` (down), `K` (up), and `L` (right).

In `vi`, you can use `Cntrl+G` to which line of how many lines your cursor is
current on.
This be used to tell you how long the file that you're viewing is.
To delete lines, you can specify a number and then `dd`.
So `22dd` would delete 22 lines starting with the line your cursor is on.
A single `dd` will delete the line your cursor is on.

If you're using a Linux system, there is a good chance that your system
administrator has installed the
[gedit text editor](https://help.gnome.org/users/gedit/stable/index.html.en),
which can be opened from the command line through `gedit filename`.
It is a lot easier to navigate for files that need a massive overhaul, but
there are definitely circumstances where `vi` has uses (\* *cough supercomputers
    and jobfiles cough* \*).

{% include links.html %}
