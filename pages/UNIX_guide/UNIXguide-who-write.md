---
title: who and write
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-who-write.html
folder: UNIX_guide
---

Similar to `wall`, messages can be sent to an individual user using `write`.
First, you need to know `who` that individual user is (another straightforward
    command--amazing).
```bash
emmett@splinter:~$ who
emmett   tty7         2018-03-08 12:18 (:0)
hatice   pts/2        2018-03-07 09:40 (10.144.120.1)
hatice   pts/18       2018-03-07 09:52 (10.144.120.1)
hatice   pts/9        2018-03-08 10:49 (10.144.120.1)
hatice   pts/1        2018-03-08 14:42 (10.144.120.1)
emmett   pts/20       2018-03-09 09:53 (10.144.120.22)
emmett   pts/21       2018-03-09 09:53 (10.144.120.22)
```
In the example, 6 Terminal windows are open on `splinter`.
The user `hatice` has 4 windows open, while `emmett` has 3 open, one of which
is through an `ssh` session.
The dates and times specify when the window was first opened.
Now that we know who has windows open, and what they are (shown in the second
    column), we can send a message to any of those windows.
I chose to write a message to myself.
This is what the writing terminal looks like.
```bash
emmett@splinter:~$ write emmett pts/20
Hi pal! Nice you see that I can talk to you via ssh!
I\'m glad I can take over your Terminal. Now get back to work!
```
Like before, I can use enter for line breaks, and I send by using Cntrl+D
(and not command if on a Mac).
This is what the receiving Terminal looks like (it literally takes over so you 
    can't do work).
```bash
emmett@splinter:~$
Message from emmett@splinter on pts/21 at 09:54 ...
Hi pal! Nice you see that I can talk to you via ssh!
I\'m glad I can take over your Terminal. Now get back to work!
EOF
```
After the `EOF` (End-of-File), you can hit enter to get the command prompt back.

{% include links.html %}
