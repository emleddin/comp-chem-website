---
title: diff
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-diff.html
folder: UNIX_guide
---

You can check for differences line by line in files using the `diff` command.
First, let's examine these two files using [cat](UNIXguide-cat.html).
```bash
$ cat example-file.txt
cat
dog
fish
elephant
monkey
snake
insect
spider

$ cat other-file.txt
cat
dog
fish
elephant
money
snakey wakey
insect
spider
```

There are two points of difference, which can then be identified with `diff`.
```bash
$ diff example-file.txt other-file.txt
5,6c5,6
< monkey
< snake
- - -
> money
> snakey wakey
```
Notice, that even though line 6 had `snake`, the difference was flagged because
the entire line didn't match.

{% include links.html %}
