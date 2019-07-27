---
title: sed
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-sed.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

In the 1970s, `sed`, a Stream EDitor, was created.
`sed` reads files line by line, is mainly used for search and replace, and
doesn't edit the input file by default (instead printing the information to the
    screen).
The options for `sed` change with each operating system, so I'll stick the the
options for GNU ("GNU's Not UNIX", aka the precursor to Linux and what Linux
systems use).

Generic `sed` commands follow the syntax of:
```bash
$ sed 'script' input_file
```
So, if you wanted to search for every instance of the word "hello" and change
it to "world" in a file named `input.txt`, creating a new file with those
changes called `output.txt`, then the command would look like
```bash
$ sed 's/hello/world/g' input.txt > output.txt
```
If you wanted these changes to be reflected in the original file by overwriting
it, then you would instead use the `-i` flag, which edits in-place.
```bash
$ sed -i 's/hello/world/g' input.txt
```
In these examples, the `s/` stands for search and the `g` stands for global;
together they are the equivalent of "find and replace all."
Not including the `g` will make turn an `example.txt` file like
```bash
__hello__ my dearest friend __hello__
my deepest __hello__ unto you
can you reply to __hello__ with __hello__
I only say __hello__ to myself
```
into this
```bash
__world__ my dearest friend __hello__
my deepest __world__ unto you
can you reply to __world__ with __hello__
I only say __world__ to myself
```
because, once again, `sed` makes changes line by line.
Similarly, `sed` is not recursive, so you can globally replace a word with a
phrase containing the world multiple times without causing an infinite loop.

Now, single quotes are not always critical to the use of `sed`, but they won't
hurt anything either.
Basically, they're necessary for meta-characters (aka anything you shouldn't
include in a [file name](UNIXguide-housekeeping.html)).
Thus, since nobody understands `sed`, and the people writing `sed`
documentation suggest using single quotes every time, you should just learn
`sed` using single quotes every time.

You can also delete lines with `sed`.
To edit a file by removing the first line, then you would use
```bash
$ sed -i '1d' filename
```
In the example, `1d` essentially stands for first line deletion.

Using `a\` ("append") can add lines to a file.
```bash
$ sed '/hello/ a\ Add this line after every line with hello' example.txt
hello my dearest friend hello
 Add this line after every line with hello
my deepest hello unto you
 Add this line after every line with hello
can you reply to hello with hello
 Add this line after every line with hello
I only say hello to myself
 Add this line after every line with hello
```

You can "insert" lines with `i\`
```bash
$ sed '/hello/ i\ Look at me go' example.txt
 Look at me go
hello my dearest friend hello
 Look at me go
my deepest hello unto you
 Look at me go
can you reply to hello with hello
 Look at me go
I only say hello to myself
```
 or "change" lines with `c\`
```bash
$ sed '/my/ c\ well this was dumb' example.txt
 well this was dumb
 well this was dumb
can you reply to hello with hello
 well this was dumb
```

These commands can easily be created into a script for editing files.
Say you wanted to delete the CRYST line from all the PDB files in a folder.
Hmmm, it's almost like VMD hates this line from
[Avogadro-generated](https://avogadro.cc/) files.
To do this, you could write a script like:
```bash
#!/bin/bash
sed -i '/CRYST/ c\' *.pdb
```

If you have symbolic links (see [ln](UNIXguide-ln.html), you can have `sed`
follow the symbolic links. To do that, use something like:
```bash
$ sed -i --follow-symlinks 's/^/\t/' *.txt
```
In that example, a tab (`\t`) is inserted at the beginning of each line (`^`)
of every `.txt` file, including following through to the referenced files of
symbolic links.

Finally, old versions of `sed` only allowed the first line of a script to be a
comment, but now comments can be used anywhere in the script, though to be safe
they should be entered on their own line of the script.

More information on `sed` is available
[here](https://www.gnu.org/software/sed/manual/sed.html) and
[here](http://www.grymoire.com/unix/sed.html).

{% include links.html %}
