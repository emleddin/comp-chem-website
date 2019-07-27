---
title: Fully Removing Packages (and Kernels) with a Package Manager
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-package-manager-uninstall.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

During program [installations](UNIXguide-package-manager-install.html),
there are dependent system components that are also installed, that may be
spread in various places throughout the computer.
Thus, to safely uninstall them, you would use
```bash
$ sudo [command] autoremove program_name
```
One area where this is critical is removing the old kernel (after testing the
    system!), because the old kernel keeps a complete previous back-up, using
    valuable system memory in `/boot`.

{% include links.html %}
