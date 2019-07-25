---
title: history
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-history.html
folder: UNIX_guide
---

Unix shells keep a log of your previously run commands (that's how the up arrow
function works).
To print your history, use `history number`, where the number specifies how
many lines to print (the default is to print your entire log, since the last
    system restart).
```bash
[euid123@t3-login1 ~]$ history 10
  896  exit
  897  history 10
  898  exit
  899  ls
  900  pwd
  901  top
  902  cd testingR/
  903  ls
  904  cd ..
  905  history 10
```

{% include links.html %}
