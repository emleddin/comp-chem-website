---
title: Housekeeping
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-housekeeping.html
folder: UNIX_guide
---

Using the command line is going to be a lot easier if you keep a few simple
tips in mind.

1. For the love of everything, please name files and directories (folders)
following a specific set of conventions. What are those conventions?
Well, for starters, don't use any of the symbols in the
[table below](UNIXguide-housekeeping.html#table).

# Table: Symbols on the naughty list {#table}

| ---------------------- | --------------------- | ------------------- |
| # pound                | < left angle bracket  | $ dollar sign       |
| % percent              | > right angle bracket | ! exclamation point |
| & ampersand            | * asterisk            | \' single quotes    |
| { left curly bracket   | ? question mark       | \" double quotes    |
| } right curly bracket  | / forward slash       | : colon             |
| \ back slash           | blank spaces          | @ at sign           |
| ; semicolon            | ~ tilde               | \| pipe             |


* "But I already used these symbols in my past naming! What do I do now?"
  Well, my personal suggestion (for everything other than spaces), is that you
  should rename them through the normal way of accessing folders and
  right-clicking the name.
  Trying to rename them through the command line is just going to return errors.
	Spaces can be addressed through using `\ /` in place of the space and
  renaming them through [mv](UNIXguide-mv.html), but this can get rather
  annoying if you have similarly named files, all with spaces.
* "I can't use spaces! What do I do now?!?" Welcome to Computer 101.
  The easiest way around using spaces is through `_` (the underscore) or `-`
  (the dash).
	People that do a lot of web-work are vehemently against underscores because
  of the implications in search engine indexing and website creation.
	So if that seems like you, or will eventually be you, you probably just want
  to use dashes.

2. Do not start or end file names with spaces, periods, hyphens, or underscores.

3. Keep file names relevant, but on the shorter side. Linux has a max filename
  length of 255 characters (who needs that many?!?) and a maximum path length
  of 4096 (information on paths can be found in [pwd](UNIXguide-pwd.html)).

4. Operating systems are case sensitive, so it's always a good idea to use
  lowercase for everything.
  I use uppercase for directories and acronyms; keep yourself consistent.
  The file `Alpha.txt` is different from `alpha.txt`, and thus both could exist
  within a given directory.

5. Don't name files the same thing as a Unix command. Why you would even
  consider this, I don't really know.

6. File extensions are important. Try to use widely-known ones, like `.txt` for
  a text file. Scripts usually end with `.sh`, python scripts usually end
  with `.py`.

{% include links.html %}
