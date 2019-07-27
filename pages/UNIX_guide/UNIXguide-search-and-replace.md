---
title: Search and Replace All
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-search-and-replace.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

Similarly to find and replace all in Microsoft products, you can use `:\%s` to
search and replace in the [vi](UNIXguide-vi.html) editor.
Practically, to search for `gobbledygook` and replace it with `balderdash` in
your file, first hit escape before typing `:\%s/gobbledygood/balderdash/g` and
hitting enter.
The `g` makes it global (meaning every instance is changed).

{% include links.html %}
