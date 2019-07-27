---
title: "Example CPU Script (Min-Eq)"
sidebar: AMBER_sidebar
permalink: AMBERguide-CPU-run-script.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

Run scripts, or jobfiles, contain all the necessary information to run a job.
An example is the `mineq.sh` script (thanks, Alice!). Doubly-commented parts
(`##`) are included here for explanation purposes.

To use this with as little modification as possible, copy your
`whatever-random-name.inpcrd` as `whatever-random-name_init0.rst`, and then
modify this script to change the `#PBS -N` line and change the
`WT_protein_system_wat` prefix to match `whatever-random-name.prmtop`.
```bash
#!/bin/bash                        ## Tell the script to run in a bash shell
#PBS -q my_cpu_alloc               ## Use CPUs to run the job
#PBS -l nodes=1:ppn=20,mem=20GB	   ## Use 1 node, with 20 processors per node
                                   ## and 20GB memory
#PBS -j oe				     ## Combine standard output & standard error files
#PBS -r n					 ## Says the job is not rerunnable
#PBS -o err.error			 ## Write printed errors to a file titled err.error
#PBS -N WT_protein			 ## Name of the job to appear in queue

## Access the directory you submitted from
cd $PBS_O_WORKDIR

## Make a nodefile for all of the CPUs to communicate from
cat $PBS_NODEFILE  > $PWD/PBS_NODEFILE
## Load the Amber module
module load amber/19-mvapich2

## Set counters for loop
e=0
f=1

## While file numbers less than 4, run this command
while [ $f -lt 4 ]; do

## Use 20 processors to use the parallel CPU pmemd amber code
## Use the respective mdin corresponds to the value of $f
## So loop 1 uses mdin.1 (etc, etc.)
## -o is your outfile, -p is your topology (prmtop)
## -c is your last save restart file, -r is the restart file written to
## -x is the velocity file written to, -ref is the reference (last restart file)
mpirun -np 20 -hostfile $PWD/PBS_NODEFILE $AMBERHOME/bin/pmemd.MPI -O -i mdin.$f \
-o WT_protein_system_wat_init$f.out \
-p WT_protein_system_wat.prmtop \
-c WT_protein_system_wat_init$e.rst \
-r WT_protein_system_wat_init$f.rst \
-x WT_protein_system_wat_init$f.mdcrd \
-ref WT_protein_system_wat_init$e.rst

## Update counters for loop
e=$[$e+1]
f=$[$f+1]
done
```

{% include links.html %}
