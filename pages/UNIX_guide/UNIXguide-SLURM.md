---
title: Using SLURM Schedulers
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-SLURM.html
folder: UNIX_guide
---

A SLURM queue manager is a slightly more unpopular queue scheduler.
Unlike a PBS or SGE scheduler, the commands are slightly less straightforward.
If this quick guide doesn't provide enough detail, there is more information
available on [UNT's HPC website](https://hpc.unt.edu/slurm) or the
[Slurm website](https://slurm.schedmd.com/sbatch.html).

# CPU Run Scripts {#CPU}

Run scripts, or jobfiles, contain all the necessary information to run a job.
An example is the `run-R.job` script.
```bash
#!/bin/bash
#SBATCH -p public                 # partition
#SBATCH --qos general             # quality of service (priority)

module load R/R-devel

R CMD BATCH clogit.R OUT1.R
```
The very first line specifies that it is a bash script (feel free to read more
    about that on [WikiBooks](https://en.wikibooks.org/wiki/Bash_Shell_Scripting)).
The next two lines specify where the job should be run on the cluster.
The `module load` line tells the cluster to locate the shared location for the
cluster's program.
In this case, instead of a local installation of R in an individual's home
directory, the entire cluster can use the installed R.
Finally, the last line is the command used to run a specific function.
In this case, it's to use R on the pre-created R script, `clogit.R`, and give
the output file as `OUT1.R`.
The list of available modules can be checked through the `module avail` command.

The next script is a Gaussian run script for Talon3.
It follows the same idea as the one for PBS, but with some extra SLURM commands.
```bash
#!/bin/bash
#SBATCH -J My_Gauss_Job        # name in queue
#SBATCH -o Gauss_job.o%j       # output
#SBATCH -e Gauss_job.e%j       # error
#SBATCH -C c6320               # contraint -- specific nodes
#SBATCH -p public              # partition
#SBATCH -N 1                   # Nodes
#SBATCH -n 16                  # Tasks per node
#SBATCH --mem-per-cpu=150MB    # memory allocation
#SBATCH -t 12:00:00            # Wallclock time (hh:mm:ss)

## Loading Gaussian module
module load gaussian/g16-RevA.03-ax2

## input is the name of your job input without the file extension
## and ext is the file extension
## so this job is for test.gjf
## Old versions would resemble test.com
input=test
ext=gjf

## Define scratch directory
export GAUSS_SCRDIR=/storage/scratch2/$USER/$SLURM_JOB_ID
mkdir -p $GAUSS_SCRDIR

## Copy your current folder to the scratch directory
cp $SLURM_SUBMIT_DIR/$input.$ext $GAUSS_SCRDIR

## Go to the scratch directory to run the calculation
cd $GAUSS_SCRDIR

## Run the program
time g16 < $input.$ext > $input.log

## Bring log file, checkpoint, wavefunction and info files
## back to the place you submitted the job from
cp -r $GAUSS_SCRDIR/$input.log $SLURM_SUBMIT_DIR
cp -r $GAUSS_SCRDIR/$input.chk $SLURM_SUBMIT_DIR
#cp -r $GAUSS_SCRDIR/$input.wfn $SLURM_SUBMIT_DIR

#echo "Job finished at"
#date

exit 0
```

# GPU Run Scripts {#GPU}

The following is an example script to run GPU AMBER jobs on Talon3.
```bash
#!/bin/bash

#SBATCH -J WT_protein           # name of job in queue
#SBATCH -o WT_protein.o%j       # output file (%j appends job name)
#SBATCH -p public               # partition
#SBATCH --qos general           # quality of service
#SBATCH --ntasks=1              # Number of nodes
#SBATCH --gres=gpu:2            # 2 GPUs
#SBATCH -t 12:00:00             # Wallclock time (hh:mm:ss)

### Loading modules
module load amber/18-cuda-mpi

e=0
f=1

while [ $f -lt 101 ]; do

$AMBERHOME/bin/pmemd.cuda -O -i mdin.4 \
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

# sbatch {#sbatch}
Submitting jobs is done with the `sbatch` command.
To submit a jobfile named `jobfile`, the command would simply be:
```bash
$ sbatch jobfile
```
The jobfile has a string of information for running the job, and must include
the `#!/bin/bash` line at the start.

Dependent submissions i.e. job B needs the output from job A but job A isn't
finished and you want to submit job B right now going to sleep, can be
accomplished through something like:
```bash
$ sbatch --dependency=afterok:12345 jobfile
```
where `12345` is the job ID of `job A` and `jobfile` is the jobfile of `job B`.
The job ID is given when `job A` is submitted, but it can also be checked in
the queue with [squeue](UNIXguide-SLURM.html#squeue).

# squeue {#squeue}

If you want to see what jobs you have running or waiting to run (queued jobs),
then use `squeue`.
Using `squeue` alone will show the jobs status for every single user within the
SLURM manager.
To check the queue for a specific job, then you would need to do something like
```bash
$ squeue 1323523
```
where `1323523` is the job number that was given when the job was submitted.
Alternatively, to show just what you, a specific user, are running, use
`squeue -u`.

# scancel {#scancel}
Sometimes you scream out in horror when you realize that you shouldn't have
submitted a job yet, or it's taking too long and you'd rather just kill it.
On SLURM systems, this can be done with `scancel`.
Again, the job number will need to be added, so that it's practically look like:
```bash
$ scancel 1323523
```
where `1323523` is the job number that was given when the job was submitted.

{% include links.html %}
