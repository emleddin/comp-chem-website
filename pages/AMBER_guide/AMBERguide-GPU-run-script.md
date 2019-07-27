---
title: "Example GPU Script (Production)"
sidebar: AMBER_sidebar
permalink: AMBERguide-GPU-run-script.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

There are not many differences between a script to run on GPUs versus CPUs,
other than specifying the actual location to run. The following is an example
of the `dyanamicsgpu.sh` AMBER script to run on GPUs (thanks again, Alice!).
Doubly-commented parts (`##`) are included here for explanation purposes.

```
#!/bin/bash                  ## Tell the script to run in a bash shell
#PBS -q my_gpu_alloc         ## Queue allocation
#PBS -l n11-12-13	         ## Specify this GPU node to run on
#PBS -j oe				     ## Combine standard output & standard error files
#PBS -r n					 ## Says the job is not rerunnable
#PBS -o err.error			 ## Write printed errors to a file titled err.error
#PBS -N WT_protein_GPU		 ## Name of the job to appear in queue

## Specify which specific GPU card to run on
export CUDA_VISIBLE_DEVICES=3

## Access the directory you submitted from
cd $PBS_O_WORKDIR

## Load the Amber module
module load amber/16-cuda_serial

## Set counters for loop
e=0
f=1

## While file numbers less than 101, run this command
while [ $f -lt 101 ]; do

## Use pmemd.cuda (GPU) amber code
## Use mdin.4 for the entire loop
## -o is your outfile, -p is your topology (prmtop)
## -c is your last save restart file, -r is the restart file written to
## -x is the velocity file written to, -ref is the reference (last restart file)
$AMBERHOME/bin/pmemd.cuda -O -i mdin.4 \
-o WT_protein_system_wat_md$f.out \
-p WT_protein_system_wat.prmtop \
-c WT_protein_system_wat_md$e.rst \
-r WT_protein_system_wat_md$f.rst \
-x WT_protein_system_wat_md$f.mdcrd \
-ref WT_protein_system_wat_md$e.rst

## Update counters for loop
e=$[$e+1]
f=$[$f+1]
done
```

{% include note.html content="It is also important to check that you're not
accidentally overlapping with someone by connecting to the specific node with
`ssh` and using the `nvidia-smi` command." %}

The following covers how to read the `nvidia-smi` output.
```
$ ssh n11-12-23
Last login: Sat Oct 27 18:52:32 2018 from mycomputer.local
Rocks Compute Node
Rocks 6.2 (SideWinder)
Profile built 20:47 28-Sep-2016

Kickstarted 15:48 28-Sep-2016
C4130(n11) Appliance
$ nvidia-smi
Tue Oct 30 15:34:35 2018       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 367.48                 Driver Version: 367.48                    |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  Tesla K80           On   | 0000:06:00.0     Off |                    0 |
| N/A   51C    P0   139W / 149W |    494MiB / 11439MiB |     94%      Default |
+-------------------------------+----------------------+----------------------+
|   1  Tesla K80           On   | 0000:07:00.0     Off |                    0 |
| N/A   73C    P0   133W / 149W |    494MiB / 11439MiB |     86%      Default |
+-------------------------------+----------------------+----------------------+
|   2  Tesla K80           On   | 0000:0A:00.0     Off |                    0 |
| N/A   22C    P8    26W / 149W |      0MiB / 11439MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+
|   3  Tesla K80           On   | 0000:0B:00.0     Off |                    0 |
| N/A   22C    P8    29W / 149W |      0MiB / 11439MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+
|   4  Tesla K80           On   | 0000:0E:00.0     Off |                    0 |
| N/A   21C    P8    28W / 149W |      0MiB / 11439MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+
|   5  Tesla K80           On   | 0000:0F:00.0     Off |                    0 |
| N/A   56C    P0   150W / 149W |    494MiB / 11439MiB |     99%      Default |
+-------------------------------+----------------------+----------------------+
|   6  Tesla K80           On   | 0000:12:00.0     Off |                    0 |
| N/A   21C    P8    28W / 149W |      0MiB / 11439MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+
|   7  Tesla K80           On   | 0000:13:00.0     Off |                    0 |
| N/A   56C    P0   151W / 149W |    494MiB / 11439MiB |     99%      Default |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID  Type  Process name                               Usage      |
|=============================================================================|
|    0     94257    C   /share/apps/AMBER/amber16/bin/pmemd.cuda       492MiB |
|    1     93626    C   /share/apps/AMBER/amber16/bin/pmemd.cuda       492MiB |
|    5     93800    C   /share/apps/AMBER/amber16/bin/pmemd.cuda       492MiB |
|    7     93644    C   /share/apps/AMBER/amber16/bin/pmemd.cuda       492MiB |
+-----------------------------------------------------------------------------+
$ exit
logout
Connection to n11-12-13 closed.
```

This command shows us that someone is running something on GPUs 0, 1, 5, and 7.
Each of those was specified in the individual GPU script for the particular
system running on that specific GPU node (with something like
    `export CUDA_VISIBLE_DEVICES=7`).

{% include important.html content="Not every system has `nvidia-smi` configured
correctly. Make sure you check with someone locally that the numbers in the
command and the numbers for exporting `CUDA_VISIBLE_DEVICES` match up." %}

{% include links.html %}
