---
title: "crontab: a Scheduling Tool"
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-crontab.html
folder: UNIX_guide
---

Commands can be set up to run at specific intervals using `crontab`.
For instance, automatic backups to an external hard drive can be scheduled to
run weekly.
The name is derived from Kronos, the Greek god of time, and "table," since the
information is organized in a tabular way.

To edit your `crontab` and set up jobs, use `crontab -e`.
This command brings up a file with a lot of comment lines, which should be left
in the file to help future you.
```bash
# Edit this file to introduce tasks to be run by cron.
#
# Each task to run has to be defined through a single line
# indicating with different fields when the task will be run
# and what command to run for the task
#
# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').#
# Notice that tasks will be started based on the cron's system
# daemon's notion of time and timezones.
#
# Output of the crontab jobs (including errors) is sent through
# email to the user the crontab file belongs to (unless redirected).
#
# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
#
# For more information see the manual pages of crontab(5) and cron(8)
#
# m h  dom mon dow   command

30 20 * * 4 /home/george/autobackup.sh
```
The last line is the actual specifics for `crontab`.
First, the date and time that the command should be executed is specified.
It follows minute | hour | day of month | month | day of the week.
The example has this set up to run every Thursday (day 4) at 8:30 pm.
The week starts with 0 or 7 assigned as Sunday.
The asterisks are essentially an "it doesn't matter" measure.
Finally, the script and location to be executed, which in this case is a script
titled `autobackup.sh` in George's home folder, is specified.

Other flags for `crontab` include `-l`, which lists the information in your
crontab, and `-r`, which removes and unschedules crontab jobs.
Additionally, those with [sudo](UNIXguide-sudo.html) power can set up, list,
and remove the `crontab` of other users by specifying their username in the
command.
```bash
$ sudo crontab -u steve -e
```

# Autobackup script

The following is the example script used in the `crontab` section:
```bash
#/bin/bash

NOW=$(date +"%m_%d_%Y")
cp -r ~/Research /media/george/Seagate\ Expansion\ Drive/Backups/
tar -cjvf /media/george/Seagate\ Expansion\ Drive/Backups/Research_$NOW.tar.bz2 /media/george/Seagate\ Expansion\ Drive/Backups/Research/
```
What happens is that the variable `NOW` is set as the current date and time.
Then, the `Research` folder is copied to the external device.
Then, that folder is compressed into a [tarball](UNIXguide-tar.html).
After creation, this file needs to be made executable with
[chmod u+x autoback up.sh](UNIXguide-local-jobs.html#chmod).


## Secondary Autobackup Script
This regular autobackup script is helpful if you have a mounted drive with
spaces in the name.
One of the things it does is it copies the entire folder as normal to the hard
drive, and then adds a secondary compressed folder.
For a 1TB hard drive with a 1TB external, that is not going to work.
Therefore, I personally would suggest renaming your external device.
First, plug the device into the computer. Then, use
[mount](UNIXguide-mount.html) and locate the device's name.
A lot of information will come on screen, but you're looking for a specific
line (which is shown below).
```bash
$ mount
/dev/sda1 on /media/georgina/Seagate\ Expansion\ Drive/ type fuseblk (rw,nosuid,nodev,relatime,user_id=0,group_id=0,default_permissions,allow_other, blksize=4096,uhelper=udisks2)
```
The mounted device is listed with both it's device location `/dev/sda1` and it's
 more human-readable location and name `/media/georgina/Seagate\textbackslash{} Expansion\textbackslash{} Drive/`.
Assuming that the drive is in NTFS format (again, please head to the
    [mount](UNIXguide-mount.html) section), then an administrator can use the
    `nstflabel` command to rename the device using underscores.
```bash
$ sudo ntfslabel /dev/sda1 Seagate_Expansion_Drive
```
This removes errors in running the script due to spaces
([because computers hate spaces in names](UNIXguide-housekeeping.html)).
Finally, we are ready to create the run script!
```bash
#/bin/bash

# Backup destination
backdest="/media/georgina/Seagate_Expansion_Drive/Backups"

#Labels for backup name
type="Research"
NOW=$(date +"%m_%d_%Y")
backupfile="$type-$NOW.tar.bz2"

cd $backdest
tar -cvpzf $backupfile /home/georgina/Research
```
Two things to note here.
The first is that we change directories to a specific location in this script,
so that [tar](UNIXguide-tar.html) can be used from there.
Second, we are using a `.bz2` file extension.
You can use a `.gz` if you wish (it's faster), but `.bz2` will compress the
files more (and we went through this process to ensure there was enough space).
Remember, once this script is created, it needs to be made executable through
something like [chmod u+x autobackup-tar.sh](UNIXguide-local-jobs.html#chmod).


{% include links.html %}
