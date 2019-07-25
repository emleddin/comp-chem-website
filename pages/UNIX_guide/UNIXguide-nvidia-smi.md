---
title: nvidia-smi
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-nvidia-smi.html
folder: UNIX_guide
---

The way to check GPUs for running jobs is to use the `nvidia-smi` command.
Using this command is not only helpful to see which GPUs are available (so you
    don't double up on jobs and lead to things like overheating...) but also to
    check that your submitted jobs are actually running.
In the following example, AMBER is running on core 3, and nothing else is
running on cores 0-2 and 4-7.

```bash
Mon Mar  5 21:37:17 2018       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 367.48                 Driver Version: 367.48                    |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  Tesla K80           On   | 0000:06:00.0     Off |                    0 |
| N/A   21C    P8    26W / 149W |      0MiB / 11439MiB |      0\%      Default |
+-------------------------------+----------------------+----------------------+
|   1  Tesla K80           On   | 0000:07:00.0     Off |                    0 |
| N/A   27C    P8    29W / 149W |      0MiB / 11439MiB |      0\%      Default |
+-------------------------------+----------------------+----------------------+
|   2  Tesla K80           On   | 0000:0A:00.0     Off |                    0 |
| N/A   22C    P8    28W / 149W |      0MiB / 11439MiB |      0\%      Default |
+-------------------------------+----------------------+----------------------+
|   3  Tesla K80           On   | 0000:0B:00.0     Off |                    0 |
| N/A   62C    P0   147W / 149W |    290MiB / 11439MiB |     99\%      Default |
+-------------------------------+----------------------+----------------------+
|   4  Tesla K80           On   | 0000:0E:00.0     Off |                    0 |
| N/A   21C    P8    25W / 149W |      0MiB / 11439MiB |      0\%      Default |
+-------------------------------+----------------------+----------------------+
|   5  Tesla K80           On   | 0000:0F:00.0     Off |                    0 |
| N/A   27C    P8    31W / 149W |      0MiB / 11439MiB |      0\%      Default |
+-------------------------------+----------------------+----------------------+
|   6  Tesla K80           On   | 0000:12:00.0     Off |                    0 |
| N/A   21C    P8    26W / 149W |      0MiB / 11439MiB |      0\%      Default |
+-------------------------------+----------------------+----------------------+
|   7  Tesla K80           On   | 0000:13:00.0     Off |                    0 |
| N/A   28C    P8    27W / 149W |      0MiB / 11439MiB |      0\%      Default |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID  Type  Process name                               Usage      |
|=============================================================================|
|    3     64236    C   /share/apps/AMBER/amber16/bin/pmemd.cuda       288MiB |
+-----------------------------------------------------------------------------+
```

{% include links.html %}
