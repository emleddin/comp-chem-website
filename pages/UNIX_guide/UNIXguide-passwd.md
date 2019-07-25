---
title: "passwd: Changing your Password"
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-passwd.html
folder: UNIX_guide
---

Changing your password can be done through the command line with `passwd`.
```bash
euid123:~$ passwd
Changing password for used euid123.
(current) LDAP Password:
New password:
Retype new password:
passwd: all authentication tokens updated successfully.
```
New passwords should be slightly complex (meaning digits 0 through 9,
    punctuation marks, and different cases of letters), otherwise the command
    will reject it (and if not, it *should* reject it).
Passwords should be at least 6 characters long.
If the system requires regular password changes, then it will alert you that
it is close to expiring.

{% include links.html %}
