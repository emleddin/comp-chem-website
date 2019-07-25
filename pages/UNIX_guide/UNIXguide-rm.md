---
title: rm
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-rm.html
folder: UNIX_guide
---

Sometimes you need to permanently delete things.
For instance, you realized after 2802 attempts that attempt 1 was just horribly
incorrect and is taking up valuable memory. The command to use is `rm`, which
means to "remove."
To remove an individual file, titled `badfile.txt`, use
```bash
$ rm badfile.txt
```
Sometimes, that's not enough though, and your entire directory for `Attempt_1`
needs to go.
In that case, you'll need the `-r` flag, which makes the deletion recursive.
```bash
$ rm -r Attempt_1
```

{% include links.html %}
