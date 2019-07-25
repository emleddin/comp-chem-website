---
title: "less: Safe Viewing"
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-less.html
folder: UNIX_guide
---

Because with [vi](UNIXguide-vi.html) there is a potential for data loss or
overwriting, you may wish to have a "safe" way to view files.
Viewing files with `less` does just that.
The command syntax is
```bash
$ less filename
```
To quit `less` mode, you can use `q`, `Q`, `:q`, `:Q`, or `ZZ`.
You can also invoke a search for patterns with `/`, typing the pattern, and
hitting enter.
If you accidentally type a slash, you can just backspace until it is gone.
Page navigation can be done through the arrow keys, in addition to page up
using `b` (for back) and page down with the space bar.
Like with [vi](UNIXguide-vi.html), typing `Shift+G` will bring you to the end
of the file.

The [man](UNIXguide-man-pages.html) page provides a lot more information on
`less` mode.

{% include links.html %}
