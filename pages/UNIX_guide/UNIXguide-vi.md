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

{% include note.html content="Most of the time, `vi` is actually `vim` but an
alias was set so that they're the same. `vim` stands for \"Vi IMproved.\"" %}

The "undo" button is not [cntrl+Z](UNIXguide-cntrl-z.html), since that has
already been taken for suspense (ha).
Instead, undo is `:u`.
Practically, this is `Shift+;+u`, since colon is an uppercase symbol.

Another useful feature from within the visual editor is `Shift+G`.
{% include note.html content="The `+` stands for \"and\" here." %}
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

If you need line numbers, you can turn them on with `:set nu` or `:set number`.
They can be turned off with `:set nu!` or `:set nonumber`.
You can turn on hidden characters with `:set list` and turn them off with
`:set nolist`.

One of the benefits to using `vi` is that you can pipe through commands.
It also has a memory of these commands, accessed by typing `:` and using the
up arrow key.
For instance, you can do multiple global string replacements at once through
something like:
```
:%s/These words/This sentence/g | %s/were old/is new/g | wq
```
A file originally consisting of
```
These words were old.
These words were old.
Bye!
```
becomes
```
This sentence is new.
This sentence is new.
Bye!
```
and is saved and closed after making those changes.
You can thus make broad changes via the command line with something like:
```bash
vi file.txt -c '%s/These words/This sentence/g | %s/were old/is new/g | wq'
```
You can also create a file with a list of `vi` commands that then gets read
and executed.
That file here is `file.vim` and it contains:
```
%s/These words/This sentence/g
%s/were old/is new/g
wq
```
The command-line execution looks like:
```bash
vi -e file.txt < file.vim
```

If you're using a Linux system, there is a good chance that your system
administrator has installed the
[gedit text editor](https://help.gnome.org/users/gedit/stable/index.html.en),
which can be opened from the command line through `gedit filename`.
It is a lot easier to navigate for files that need a massive overhaul, but
there are definitely circumstances where `vi` has uses (\* *cough supercomputers
    and jobfiles cough* \*).
Personally, I think it's worth installing the
[atom text editor](https://atom.io/).

{% include links.html %}
