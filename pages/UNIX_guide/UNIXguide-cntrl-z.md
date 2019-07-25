---
title: Cntrl+Z: Background Jobs
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-cntrl-z.html
folder: UNIX_guide
---

Sometimes you have long-term jobs running locally in a Terminal, so the command
line is unavailable, but you need to do other things in said Terminal.
If you know before the job is submitted that it should be run in the background,
 then submit it with an `&`.
However, if it was submitted without the ampersand, then you can simply use
`Cntrl+Z` (like undo in Microsoft Word) to temporarily suspend the job.
To make it run in the background, type `bg`.
If it is alright to run in the foreground again, type `fg`.

Similarly, if you have an ssh connection, where the job will quit when the ssh
session has ended, then adding `nohup` before the command, in addition the
ampersand, will ensure it runs when the connection is terminated.
This is shown below.
```bash
$ nohup rsync -azvp euid123@talon3.hpc.unt.edu:/home/euid123/directory/* . &
```

{% include links.html %}
