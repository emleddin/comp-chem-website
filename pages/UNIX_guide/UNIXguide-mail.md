---
title: Mail
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-mail.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

Mail in UNIX is both a command for sending emails, and a user file that acts as
an inbox for system messages.

# Checking Mail {#check}

The mail spool is located at `/var/spool/mail/username` (where username is your
    username), and is a file that can be opened with [vi](UNIXguide-vi.html)
    (or other file viewing commands).

# Sending Mail {#send}

You can send mail to users (or email addresses, if you've gone through the work
of configuring it....) through
```bash
$ mail euid123@their.system.email.com
```
Typically, the system email involves their username and hostname (so on Talon3
    it would resemble  `euid123@talon3.hpc.unt.edu`).
Some options include the `-r` flag that can be used to specify the "from"
address, `-b` for blind carbon copies, `-c` for carbon copies, and
`-s "Mail Subject"` to specify the subject (in quotes).

{% include links.html %}
