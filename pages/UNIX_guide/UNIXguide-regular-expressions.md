---
title: Regular Expressions
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-regular-expressions.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

Regular Expressions (aka regexes) are strings that describe specific characters.
They may be used in place of something else, or to make searches more versatile,
and vary between programming languages.
More common regexes include `\t` for tab, `\n` to specify a new line.
Others are shown in the [table below](UNIXguide-regular-expressions.html#regex).

# Table: Common regular expressions. {#regex}

| Character | Usage                                                          |
| --------- | -------------------------------------------------------------- |
| ^         | matches beginning of lines                                     |
| $         | matches end of lines                                           |
| .         | matches single characters                                      |
| *         | matches zero or non-initial character appearances              |
| [chars]   | matches the specified characters; ranges denoted with - symbol |
| [0-9]     | matches a single number                                        |
| [a-zA-Z]  | matches a single letter                                        |

{% include links.html %}
