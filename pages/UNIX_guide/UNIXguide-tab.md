---
title: "Tab: the Autofill Key"
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-tab.html
folder: UNIX_guide
---

If you've ever written a paper, then you know that the Tab key exists on a
keyboard.
This key is a lazy Terminal user's best friend, because it acts as an
autofiller for unique names.
Say you want to open `theWorldsLongestDatasetwiththeWorldsLongestName.dat`.
First, that name is really long.
Second, there's a lot of weird capitalization.
Say that there are a few file names in the same directory that start with
"the," but none of them start with "theW."
Thus, you can type `vi theW` and hit the tab key.
Suddenly, what you've typed is now
`vi theWorldsLongestDatasetwiththeWorldsLongestName.dat`, and you can hit enter
to view the file.
The tab key can also be used to bring you to the next point of difference, in
addition to finishing commands or program names.
If I type just `whi`, then hit tab twice, the Terminal will list the two
things that start with `whi`, which are the `which` and `while` commands.
Thus, by then typing a `c` or `l`, and hitting tab once more, I will have the
completed command.
This is a great help if you know how a file name starts, but don't remember its
unique breaking point.

{% include links.html %}
