---
title: watch
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-watch.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

The `watch` command allows you to continuously watch a command.
To use it, start the command with the word `watch` and any options that would
be applicable to watch.
Options for the command that `watch` is being combined with go after that
command.
One option that can be used with `watch` is the `-n` flag, which allows you to
specify a time (in seconds) that the command should be renewed with.
As an example, the following command will `watch` the
[rsync](UNIXguide-rsync.html) or [qstat](UNIXguide-PBS.html) command for a
specific user, updating it every 5 seconds instead of the default 2 seconds.
```bash
$ watch -n 5 qstat -u euid123
```
Because the command is continuously updating, the only ways to end it are with
[rsync](UNIXguide-rsync.html) or [cntrl+c](UNIXguide-cntrl-c.html) or closing
the terminal.

{% include links.html %}
