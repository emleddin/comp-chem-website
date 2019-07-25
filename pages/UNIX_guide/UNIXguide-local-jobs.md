---
title: Running Jobs Locally
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-local-jobs.html
folder: UNIX_guide
---

Jobs are how you produce data and run analyses.
There are several different resources attributed to different jobs.

Some jobs are better run on local computers, as opposed to on a cluster, using
CPUs.
If you're in a computational lab, it is likely that some of your local
computers will have GPUs to run jobs on as well.

# Local CPU Run Script {#localCPU}

Running AMBER locally on CPUs eliminates the need for the queue scheduler lines.
When running these scripts, keep in mind that you will need to edit the
`while [ \$f -lt 11]` part to run the loop for the correct number of mdin files.
This specific script assumes that there are 10 mdin files running minimization,
heating, and equilibration, and an 11th specifying production. Thus, the first
10 are run on CPUs through this script.
This script also will throw up a flag if the counters for `e` and `f` are set
with brackets and not parentheses, so make sure to change that from a different
one too.
Additionally, before running on CPUs, you will need to modify the
[permissions](UNIXguide-local-jobs.html#chmod) on the script to make it
executable.
As a reminder, this can be done through `chmod u+x example_script.sh`.
After, you can run the script with [nohup](UNIXguide-cntrl-z.html), through
something like `nohup ./example_script.sh &`.
```bash
#!/bin/bash

e=0
f=1

while [ $f -lt 11 ]; do

$AMBERHOME/bin/pmemd -O -i mdin.$f \
-o WT_protein_system_wat_init$f.out \
-p WT_protein_system_wat.prmtop \
-c WT_protein_system_wat_init$e.rst \
-r WT_protein_system_wat_init$f.rst \
-x WT_protein_system_wat_init$f.mdcrd \
-ref WT_protein_system_wat_init$e.rst

e=$((e+1))
f=$((f+1))
done
```

# Local GPU Run Script {#localGPU}

As you'll see from a later ["GPU Run Script"](UNIXguide-PBS.html#GPU) section,
there are some differences between running locally and running through a
queue scheduler.
For one, essentially all of the queue scheduler lines just... disappear.
Additionally, the "export" line may or may not need to be commented out.
You only need it if there are multiple GPUs you could run on--to specify the
core you want.
```bash
#!/bin/bash
export CUDA_VISIBLE_DEVICES=0

e=0
f=1

while [ $f -lt 201 ]; do

$AMBERHOME/bin/pmemd.cuda -O -i mdin.11 \
-o WT_protein_system_wat_md$f.out \
-p WT_protein_system_wat.prmtop \
-c WT_protein_system_wat_md$e.rst \
-r WT_protein_system_wat_md$f.rst \
-x WT_protein_system_wat_md$f.mdcrd \
-ref WT_protein_system_wat_md$e.rst

e=$[$e+1]
f=$[$f+1]
done
```

# Executing Scripts (and Changing Permissions) {#chmod}

Computers, while magical beasts, can't always read your mind.
When you want to use most scripts (i.e. not one submitted to a queue
    scheduler), you'll need to use `chmod`.
This command changes the permissions of the generated file.
So, to make the script runnable (known as executable in computer speak), you
would use
```bash
$ chmod u+x
```
The letters all stand for something, and follow a syntax of `user + privilege`.
To add the permission for all users, the user group would be `a`.
Similarly, to add only yourself, the option is `u`, and to add group
permissions, the option is `g`.
All other users fall under the `o` specifier.
The different privileges available are read (`r`), write (`w`), and execute
(`x`).
If you wanted to remove permissions, then you would instead of `+` (for add,
    see what they did?!?), you would use `-`.
After using `chmod`, your job can be run (probably using
    [nohup](UNIXguide-cntrl-z.html), but I'm not you).

A few other things with `chmod`: first, if you're trying to make a directory
tree accessible, you'll need the `-r` flag to make it recursive.
Second, you can also achieve `rwx` status through using a command with numbers.
The [table below](UNIXguide-local-jobs.html#table) shows what some of these
numbers are.

Based on that table, you could use something like the following command to make
`folder_a` and all its contents have `rwx` access for the user, `rw-` access
for the group, and `r-x` access for other users.
Sometimes you'll need to have [sudo](UNIXguide-sudo.html) privileges to do this.
Also, ensure that you are using the uppercase `-R` flag for recursion, because
otherwise you can lose read access.
```bash
$ chmod -R 765 folder_a/
```

# Table: Numeric permissions with `chmod` {#table}

| Number | Function                 | Listed  | Binary Reason |
|--------|--------------------------|---------|---------------|
| 0      | No permissions given     | -{}-{}- | 000           |
| 1      | Execute only             | -{}-x   | 01            |
| 2      | Write only               | -w-     | 010           |
| 3      | Write and execute        | -wx     | 011           |
| 4      | Read only                | r-{}-   | 100           |
| 5      | Read and execute         | r-x     | 101           |
| 6      | Read and write           | rw-     | 110           |
| 7      | Read, write, and execute | rwx     | 111           |


{% include links.html %}
