---
title: Library Errors
sidebar: AMBER_sidebar
permalink: AMBERguide-library-error.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

AMBER.... breaks. Frequently.
Some things are so common that you're mildly frustrated you have to deal with
it AGAIN.
Several of these relatively common problems will be addressed here.
Other things are new and only really answered after consulting
(or even emailing!) the [AMBER Mailing List](http://archive.ambermd.org/).

One of the most common problems is that for some reason,
the script that explains AMBER, wasn't accessed before trying to use AMBER.
The error message looks something like:
```
cpptraj: error while loading shared libraries: libsander.so: cannot open shared object file: No such file or directory
```

So, if you're using a bash shell, here's what you do to fix it.
```
$ source $AMBERHOME/amber.sh
```
If you're using a c-shell environment, use:
```
$ source $AMBERHOME/amber.csh
```
If you're not sure which shell you're using, first use the `$ echo $SHELL`
command.

{% include links.html %}
