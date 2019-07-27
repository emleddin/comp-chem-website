---
title: split
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-split.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

Sometimes files are egregiously large and are downright unmanageable to look at.
The `split` command can be used to break large files into smaller components,
while keeping the original file intact.

Some `split` options include capping at a line number (shown with the `-l5`
    flag, where there are 5 max lines per file created), specifying the output
    name prefix (shown as `newname_`), and made verbose, which shows the names
    of the newly created files.

```bash
$ split -l5 example_file newname_ --verbose
creating file 'new_aa'
creating file 'new_ab'
creating file 'new_ac'
creating file 'new_ad'
creating file 'new_ae'
```

There are other options, too. `-d` will give the new files a numeric suffix,
such as `00`, instead of `aa`.
Byte sizes can be specified following the pattern in
[the table](UNIXguide-split.html#table), where the number is what you want the
max file size to be.
Alternatively, you can split it into a set number of chunks with something
like `-n5` (where it'd be broken into 5 chunks).

# Example flags for `split` byte sizes {#table}
| Flag     | Max File Size     |
|----------|-------------------|
|-b2000000 | 2000000 bytes     |
|-b 50K    | 50 kilobytes (KB) |
|-b 50M    | 50 megabytes (MB) |
|-b 1G     | 1 gigabyte (GB)   |

{% include links.html %}
