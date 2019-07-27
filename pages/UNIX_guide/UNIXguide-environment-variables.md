---
title: Environment Variables
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-environment-variables.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

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

# Setting Bash Environment Variables

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

# Setting C-Shell Environment Variables

To set an environment variable in a C-shell environment, use:
```shell
setenv VARIABLE /path/to/variable
```

# $PATH

The `$PATH` variable makes it possible to access programs simply by running
their name, which is actually the case for most commands (like
  [ls](UNIXguide-ls.html) and [head](UNIXguide-head.html)).
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

{% include links.html %}
