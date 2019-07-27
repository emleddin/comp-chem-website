---
title: Installing Packages with a Package Manager
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-package-manager-install.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

Most Unix-like systems have a package manager that can be used to install
programs.
This is typically done through:
```bash
$ sudo [command] install program_name
```
The command changes between operating systems, and obviously the program name
would change depending on what you are trying to install (a short list can be
    found in the [table below][UNIXguide-package-manager-install.html#table].
The operating systems using `apt-get` use different related commands in
different contexts.
If you wanted to search available packages, these systems would use the
`apt-cache` base command instead.
An initial search would be accomplished through:
```bash
$ [command] search program
```

# Table: Package managers for different systems {#table}

| Operating System | Command            |
|------------------|--------------------|
| Ubuntu           | apt                |
| Mint             | apt-get            |
| Debian           | apt-get            |
| CentOS           | yum                |
| Red Had          | yum                |
| Fedora           | dnf                |
| macOS X          | macports (or brew) |

So, to search for and install a specific python on an Ubuntu system, you would
use
```bash
$ apt-cache search python
-{}-{}-hundreds of results returned-{}-{}-
$ sudo apt-get install python3.6
```
However, it is strongly recommended you update the available lists before you
install something, through the following (recognizing `command` is the
    system-specific command).
```bash
$ sudo command update
```

For MacOS, you'll probably want to install
[macports](https://www.macports.org/), [brew](https://brew.sh/), or
[fink](http://www.finkproject.org/).
Depending on what things you'll be installing, you may need more than one of
these.

{% include links.html %}
