---
title: useradd
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-useradd.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

Root users can create new user accounts with
```bash
$ useradd -m newusername
```
The `-m` flag creates a home directory for the user (in this case
    `newusername`).
Once the user is created, you must set a password through
```bash
$ passwd newusername
```

{% include links.html %}
