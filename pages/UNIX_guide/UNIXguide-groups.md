---
title: Groups (a supplement to chmod)
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-groups.html
folder: UNIX_guide
---

To add people to a group, you need to know their username (imagine that).
The command to add `mark` to the `grads` group would be:
```bash
$ sudo usermod -a -G grads mark
```
The `-a` flag stands for append (or add) and the `-G` flag specifies that they
should be added to the group name following.

# Checking Groups {#checking-groups}
To check who is included in a certain group (we're going to stick with the
`grads` example), then you would use:
```bash
$ grep grads /etc/group
```
Which will give you back the usernames of everyone in the group.

# Removing Users from Groups {#removing-people-groups}
Well, if you can add people, it's only logical you can remove them too.
To remove  `mark` from the `grads` group, you would use:
```bash
$ sudo desluser mark grads
```

{% include warning.html content="If you forget to include the group category in
this command, you will just... delete the user. That's not good! Thus, a safer
way to do this would be through the \"Users and Groups\" window of the
[GUI](UNIXguide-UNIX-systems.html#GUI), which allows you to manage groups." %}

{% include links.html %}
