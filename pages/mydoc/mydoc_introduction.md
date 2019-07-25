---
title: Introduction
sidebar: UNIX_guide_sidebar
permalink: UNIX_guide_introduction.html
folder: UNIX_guide
---

This is a list of commands and their contexts for getting started with using
Unix.
It’s probably going to be somewhere between nothing and StackOverflow in
terms of explanation.
The odds are high that if you have a very specific thing that you want to do,
that someone on the internet has answered something similar to it on
[StackOverflow](https://stackoverflow.com/).

## Command Line

First, you’re going to need a way to access the command line.
If you’re on Linux or Mac machine, this is easy!
Both have applications that come with your computer named Terminal.
If you’re on a Windows device, you’ll need to download a Terminal emulator,
such as [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)
or [MobaXterm](https://mobaxterm.mobatek.net/).
After opening Terminal, you’ll probably feel like a hacker.
That’s cool. The feeling takes a long time to go away.
One thing to note, is that when using the command line, there is always who you
are and which folder you’re in to the left of where you type. This bit ends
with a `$`, which will be shown in every command line example in this guide.

## UNIX and Unix-Like File Systems

UNIX is a family of computer operating systems that meet a set of criteria
(some examples include Apple’s macOS and Oracle Solaris).
Unix-like systems are computer systems that behave similarly to UNIX,
without necessarily meeting the Single UNIX Specification.
Linux operating systems are Unix-like systems, and may be known as GNU/Linux,
due to being a GNU derivative.
Linux distributions (i.e. CentOS, Ubuntu, Debian, Fedora, Red Hat, Mint...
there are a lot) are free and open-source, and all follow a similar layout in
how they are set-up.

### Root Directory

The root directory is the penultimate directory on a Unix system, and can be
accessed through `cd /`.
The root directory is set up in a way so that only the administrator(s)
(known as the "root user(s)" can make changes in this directory.
This is a safety issue--just messing around with any old file or directory
without knowing the purpose can royally screw up the system, since these files
describe the operating system itself.

### Bin Directories

The bin directories usually hold programs.
The root bin directory can be accessed through `cd /bin`.
If you do that in a Terminal, and then use the __{\hyperref[sec:ls]{ls}__
command, you will list a bunch of different programs.
You'll even find stuff like __\hyperref[sec:ls]{ls}__!
That's because commands are programs that are accessed to do their intended
purpose.
Additional bin directories are:
```bash
/bin/
/usr/bin/
/usr/local/bin/
/sbin/
```

### Home Directory

The home directory is your safe place.
It's essentially your owner folder on the computer, which is where you'll
create all of your personal files and folders from.
You can access your home directory at any time using the
__\hyperref[sec:cd]{cd}__ command.
The home directory typically has a path of `/home/username/` which is equal
to `~/` to the computer.
Hence, anytime you're away from the confines of your own home directory
(like when copying files between computers), to navigate back to it, you'll
need to remember the tilde.
Home directories are automatically created when a new user is added to the
computer.

### Scratch Directory

The scratch directory is usually given the largest disk partition on a
computer, meaning it has the biggest space allocation.
While home directory creation is automatic, scratch directories need to be
created by the user.
To create your own, use: `$ mkdir /scratch/username`.

It is possible that you need to be a root user to create your own personal
scratch directory.
If you're a root user, you can do this with __\hyperref[sec:sudo]{sudo}__.
If you are not, then ask an administrator for help.

### Graphical User Interface

[//]: # ( \label{sec:GUI} )
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

## Shells (bash and csh)

Shells are command-line interpreters.
They are related to terminals (text input/output environment) and consoles
(physical terminals).
While consoles are terminals are similar; the shell is slightly different.
The shell is primarily used to start other programs, so you use commands in a
shell environment through the terminal or console.
That said, there are multiple types of shells, and computers can generally
switch between them.
To determine which shell type you are using, type `$ echo $SHELL` into your
Terminal window.
I almost exclusively work in a __bash__ environment, which returns
`/bin/bash` to the Terminal.
Bash is the default shell for most Linux distributions.
However, as I mentioned, there are other shells, like csh (C-shell),
zsh (Z shell), fish (friendly interactive shell), tcsh (TENEX C-shell), and
ksh (KornShell).

If I wanted to change from a bash shell to a C-shell, I would type `csh`.
To switch back, I would type `bash`.
Some programs require the use of a different shell type, which may also differ
by how it was installed.
Gaussian, for instance, likes C-shell, but newer editions have install
instructions for bash shells (in case you're wondering, the difference is
having a `.login` for C-shell and a `.profile` for bash).

### Bash Configuration File (the .bash_profile)

The `.bashrc` (and other `.bash` files) are resource files found in the home
directory.
Because they are hidden files (i.e. their filename starts with a period so
  that they do not accidentally get deleted), you need to use
  __\hyperref[sec:ls]{ls -a}__ to see them.
They list different things, like aliases or variables that should be available
across your computer upon startup.
In general, items from original `.bashrc` file should not be deleted, because
they reference other hidden files that may contain similar information.
There is usually a commented line that says to add user-specific information
after that line.

On my Mac laptop, the `.bashrc` file is called the `.bash_profile`, which is
shown below:
```bash
#Access VMD Executable
alias vmd='/Applications/VMD\ 1.9.2.app/Contents/Resources/VMD.app/Contents/MacOS/VMD'

#Access Chimera Executable
alias chimera='/Applications/Chimera.app/Contents/MacOS/chimera'

#aliases
alias work='ssh -Y username@my-work-computer.org'
alias local='ssh username@my-local-computer.com'
alias dist='ssh username@some-distant-computer.edu'

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# added by Anaconda3 5.1.0 installer
export PATH="/anaconda3/bin:$PATH"
```

As you can see, I use mine mostly for __\hyperref[sec:alias]{aliases}__.
If you are using a Linux system with a `.bashrc` file, it is generally a good
practice to save aliases under a separate `.bash_aliases` file.

Every time something is added to a `.bash` file, the `source` command needs to
be used to tell the computer to "reload" that file.
This is because every time a Terminal is opened, the `.bash` files are read
as-is to set up the environment you're working in, and changes are not tracked
throughout the session.
To source a specific file (in the following example, `.bash_aliases`, use

```bash
$ source ~/.bash_aliases
```

Bash files are different on every computer, so if you have specific things you
put into your `.bash` files to make your life easier, you'll need to copy
those lines into the `.bash` files on a new system.

### C-Shell Configuration File (the .cshrc)

Like bash shells, the C-shell has a configuration file filled with information
that helps set up the environment. C-shell uses the `.cshrc` and the
`.login` files.
The default of a `.cshrc` includes the following text,
which should not be deleted.
```bash
if (-e /usr/local/etc/csh.cshrc) then
  source /usr/local/etc/csh.cshrc
endif
fi #### THIS SHOULDN'T BE HERE!!!!
```

After those lines, or a commented line that specifies you can now add
information, you can add in specific information that you would like for the
environment (like aliases and __\hyperref[sec:env]{environment variables}__).
Like with the `.bashrc`, the `.cshrc` file needs to be sourced through a
command like `$ source ~/.cshrc`.

Similarly, the configuration files are different on every computer, so if you
have specific things you put into your `.cshrc` file to make your life easier,
you'll need to copy those lines into the `.cshrc` file on a new system.

## Environment Variables

[//]: # ( \label{sec:env} )
Environment variables are variables that help set the environment.
Since that was a horrible definition, I'll try to define by example.
The environment is the scene of the play, and the variables are the props that
help set the scene (everything from the character's clothing to the backdrop).
Basically, the environment variables are strings that the computer sees as
something else.
One example of this is the `$AMBERHOME` variable, which is used to run the
Amber program.
Instead of typing `/usr/local/amber18`, users can simply type `$AMBERHOME/`
with the rest of the command they want to use.
The specified path of an environment variable can be checked through
`$ echo $VARIABLE`

A list of all environment variables will be given with the `env` command.

### Setting Bash Environment Variables

To set an environment variable in a bash environment, use:
```bash
export VARIABLE=/path/to/variable
```
The AMBERHOME variable would be set through
```bash
export VARIABLE=/path/to/variable
```
which can be checked with
```bash
$ echo $AMBERHOME
```

### Setting C-Shell Environment Variables

To set an environment variable in a C-shell environment, use:
```shell
setenv VARIABLE /path/to/variable
```

### $PATH

The `$PATH` variable makes it possible to access programs simply by running
their name, which is actually the case for most commands (like
  __\hyperref[sec:ls]{ls}__ and __\hyperref[sec:head]{head}__).
PATH makes all of these programs accessible simultaneously, by making them
available anywhere.
Installed programs are added to the PATH.
You can also add directories or files to the PATH by defining them in the
configuration file.

For a `.bash_profile` or `.profile` (you shouldn't add user-defined path
definitions to the `.bashrc`):
```bash
export PATH=$PATH:/home/rest/of/path
```
For a `.cshrc` or `.login`:
```shell
setenv PATH $PATH\:/home/rest/of/path
```
Remember to `source` the file after things have been added.

Since the PATH includes a lot of important things, and almost none of them are
user-defined, you should not delete variables from the PATH.

## Housekeeping

[//]: # ( \label{sec:house} )
Using the command line is going to be a lot easier if you keep a few simple
tips in mind.

1. For the love of everything, please name files and directories (folders)
following a specific set of conventions. What are those conventions?
Well, for starters, don't use any of the symbols in Table __\ref{table:symbolhell}__.

Table 1: Symbols on the naughty list.
[//]: # ( \label{table:symbolhell} )

| ---------------------- | --------------------- | ------------------- |
| # pound                | < left angle bracket  | $ dollar sign       |
| % percent              | > right angle bracket | ! exclamation point |
| & ampersand            | * asterisk            | \' single quotes    |
| { left curly bracket   | ? question mark       | \" double quotes    |
| } right curly bracket  | / forward slash       | : colon             |
| \ back slash           | blank spaces          | @ at sign           |
| ; semicolon            | ~ tilde               | \| pipe             |


* "But I already used these symbols in my past naming! What do I do now?"
  Well, my personal suggestion (for everything other than spaces), is that you
  should rename them through the normal way of accessing folders and
  right-clicking the name.
  Trying to rename them through the command line is just going to return errors.
	Spaces can be addressed through using `\ /` in place of the space and
  renaming them through __\hyperref[sec:mv]{mv}__, but this can get rather
  annoying if you have similarly named files, all with spaces.
* "I can't use spaces! What do I do now?!?" Welcome to Computer 101.
  The easiest way around using spaces is through `_` (the underscore) or `-`
  (the dash).
	People that do a lot of web-work are vehemently against underscores because
  of the implications in search engine indexing and website creation.
	So if that seems like you, or will eventually be you, you probably just want
  to use dashes.

2. Do not start or end file names with spaces, periods, hyphens, or underscores.

3. Keep file names relevant, but on the shorter side. Linux has a max filename
  length of 255 characters (who needs that many?!?) and a maximum path length
  of 4096 (information on paths can be found in __\hyperref[sec:pwd]{pwd}__).

4. Operating systems are case sensitive, so it's always a good idea to use
  lowercase for everything.
  I use uppercase for directories and acronyms; keep yourself consistent.
  The file `Alpha.txt` is different from `alpha.txt`, and thus both could exist
  within a given directory.

5. Don't name files the same thing as a Unix command. Why you would even
  consider this, I don't really know.

6. File extensions are important. Try to use widely-known ones, like `.txt` for
  a text file. Scripts usually end with `.sh`, python scripts usually end
  with `.py`.

## Regular Expressions
Regular Expressions (aka regexes) are strings that describe specific characters.
They may be used in place of something else, or to make searches more versatile,
and vary between programming languages.
More common regexes include `\t` for tab, `\n` to specify a new line.
Others are shown in Table __\ref{table:regex}__.

Table 2: Common regular expressions.
[//]: # ( \label{table:regex} )

| Character | Usage                                                          |
| --------- | -------------------------------------------------------------- |
| ^         | matches beginning of lines                                     |
| $         | matches end of lines                                           |
| .         | matches single characters                                      |
| *         | matches zero or non-initial character appearances              |
| [chars]   | matches the specified characters; ranges denoted with - symbol |
| [0-9]     | matches a single number                                        |
| [a-zA-Z]  | matches a single letter                                        |

[//]: # ( To get started, see [Getting Started][index]. )

{% include links.html %}
