---
title: "No $AMBERHOME"
sidebar: AMBER_sidebar
permalink: AMBERguide-no-AMBERHOME-error.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

We talked in the [UNIX manual](UNIXguide-environment-variables.html) about
these silly variable types that start with `$`, like `$AMBERHOME`.
But what happens when there isn't actually an `$AMBERHOME`?
```bash
$ $AMBERHOME/bin/cpptraj
-bash: /bin/cpptraj: No such file or directory
```
Check your `~/.bashrc` file.

The following two lines need to appear in your `~/.bashrc` file
(with the correct version of AMBER referenced (16, 18, etc.), and sourcing
`amber.csh` if you're using a c-shell environment).
```bash
export AMBERHOME="/usr/local/amber18"
source "$AMBERHOME/amber.sh"
```

If they're not there, then you need to add them with either
[vi](UNIXguide-vi.html) or gedit.
After adding them, make sure you use  `$ source ~/.bashrc` to actually make
them available.

{% include links.html %}
