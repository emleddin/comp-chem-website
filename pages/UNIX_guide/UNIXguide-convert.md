---
title: convert
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-convert.html
folder: UNIX_guide
---

{% include note.html content="This section will really only be helpful on
Linux systems, but considering these things are covered through other means on
other operating systems, it's not the end of the world." %}

Converting between image formats can be a pain or require a photo editor.
Luckily enough, `convert` can be used to do it! The command syntax is
```bash
$ convert [input options] old_image [output options] new_image
```
For instance, you can resize images through something like this (obviously
    800x600 is not the only option)
```bash
$ convert imagename.jpg -resize 800x600 newimagename.jpg
```
{% raw %}
Some other options include `-rotate degree_number` and `-crop x{+-}{+-}{%}`.
{% endraw %}

If you're on a system without ImageMagick, consider
[downloading it](https://imagemagick.org/)
to get this command.

{% include links.html %}
