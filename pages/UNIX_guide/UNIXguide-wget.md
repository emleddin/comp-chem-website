---
title: wget
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-wget.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

The `wget` command can be used to obtain files from websites.
It can be notably faster to use `wget` than to download things like programs
or scripts and then upload them onto a cluster or workstation.

```bash
wget "https://raw.githubusercontent.com/emleddin/research-scripts/main/MD-Setup/Langevin/miller-NPT/eq1.mdin"
```

While you can use `wget` without quotes around the site/FTP location, it is
not often recommended because many web links contain characters that make the
Terminal panic.

{% include note.html content="If you do not have Internet access (this will
typically become evident if you have issues trying to update certain programs),
`wget` will not work." %}

{% include links.html %}
