---
title: kill
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-kill.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

The `kill` command is used to terminate processes.
To use it, simply use
```bash
$ kill -9 PID
```
where PID is the process ID found by using `top`.
The `-9` flag ensures that the process is killed by force.

{% include links.html %}
