---
title: sort
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-sort.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

You can sort data with the `sort` command (amazing!).
First, use [cat](UNIXguide-cat.html) to print the data.
```bash
$ cat data.txt
134
127
108
 89
185
...
```
Then we can use `sort`.
By default, the data will be sorted in ascending order.
```bash
$ sort data.txt
  2
  3
 53
 56
 74
 ...
```
The `-r` flag can be used to arrange the values in ascending order, and the
`-R` flag can be used to arrange the values randomly.
Thus, the flags are case sensitive.
```bash
$ sort -R data.txt
 94
152
185
105
143
...
$ sort -r data.txt
227
218
213
209
208
...
```
The command can also be used on files with words or letter, where the default
is alphabetical order.
```bash
$ cat words.txt
research
graduate
office
hope
pain
...
$ sort words.txt
chemistry
doctor
education
graduate
hope
...
```

{% include links.html %}
