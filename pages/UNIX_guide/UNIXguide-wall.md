---
title: wall
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-wall.html
folder: UNIX_guide
---

The `wall` command can be used to write a message to every Terminal window
currently open on a computer, including your own.
This type of thing would be useful if you wanted to warn people about an
impending shut down, but it can also be a fun way to mess with your coworkers
(though, I may have a warped sense of fun...).
The ability to send a message is brought up with `wall`, and the message is
sent using Cntrl+D (note: on a Mac it is indeed Cntrl and NOT command).
This allows you to use enter to break up information into paragraphs if you so wish.
```bash
kevin@raphael$ wall

I thought it\'d be fun to send myself a message via Terminal, because I\'m ridiculous. So here I go.

WHY AM I LIKE THIS?

Lyk this iff u cri evertim

Broadcast Message from kevin@raphael                                 
        (pts/7) at 20:34 CST...                                         


I thought it\'d be fun to send myself a message via Terminal, because I\'m ridiculous. So here I go.                                                           

WHY AM I LIKE THIS?                                                            

Lyk this iff u cri evertim                                                      

my_mac_computer:~ Owner$
```
The first iteration is what I sent, and the `Broadcast Message` is the message
that everyone received (because I received a copy when I sent it).
It includes who sent it (`kevin@raphael`) and which Terminal it was sent
from (`pts/7`).

{% include links.html %}
