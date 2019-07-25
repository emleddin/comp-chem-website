---
title: finger (and chfn)
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-finger.html
folder: UNIX_guide
---

Did I include this program under fun because body parts are funny? Indeed.
The `finger` program is used to find out information about a specific user
given their username. The command syntax is `finger username`.
I'm sure you can think of the word that Unix uses to describe this incredibly
appropriate action.
```bash
[euid123@talon3 ~]$ finger euid123
Login: euid123        			Name: Scrappy Student
Directory: /home/euid123           	Shell: /bin/bash
On since Thu Mar 29 08:03 (CDT) on pts/1 from some-computer.unt.edu
   13 minutes 37 seconds idle
On since Thu Mar 29 08:28 (CDT) on pts/2 from some-computer.unt.edu
New mail received Tue Mar 27 15:07 2018 (CDT)
     Unread since Thu Mar 22 14:38 2018 (CDT)
No Plan.
```
As you can see, you can use `finger` on your own username as a way to check to
see if you have [mail](UNIXguide-mail.html).

Additionally, you can update your personal information that appears with
`finger` using `chfn`.
Some system administrators block you from changing this information, though, so
knowing this probably isn't very helpful.

{% include links.html %}
