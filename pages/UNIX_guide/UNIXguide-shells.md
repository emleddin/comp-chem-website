---
title: Shells (bash and csh)
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-shells.html
folder: UNIX_guide
---

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

# Bash Configuration File (the .bash_profile)

The `.bashrc` (and other `.bash` files) are resource files found in the home
directory.
Because they are hidden files (i.e. their filename starts with a period so
  that they do not accidentally get deleted), you need to use
  [ls -a](UNIXguide-ls.html) to see them.
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

As you can see, I use mine mostly for [aliases]](UNIXguide-aliases.html).
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

# C-Shell Configuration File (the .cshrc)

Like bash shells, the C-shell has a configuration file filled with information
that helps set up the environment. C-shell uses the `.cshrc` and the
`.login` files.
The default of a `.cshrc` includes the following text,
which should not be deleted.
```bash
if (-e /usr/local/etc/csh.cshrc) then
  source /usr/local/etc/csh.cshrc
endif
```

After those lines, or a commented line that specifies you can now add
information, you can add in specific information that you would like for the
environment (like aliases and
    [environment variables](UNIXguide-environment-variables.html)).
Like with the `.bashrc`, the `.cshrc` file needs to be sourced through a
command like `$ source ~/.cshrc`.

Similarly, the configuration files are different on every computer, so if you
have specific things you put into your `.cshrc` file to make your life easier,
you'll need to copy those lines into the `.cshrc` file on a new system.

{% include links.html %}
