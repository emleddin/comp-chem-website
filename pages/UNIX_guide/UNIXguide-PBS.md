---
title: Using PBS Schedulers
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-PBS.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

The most common queue manager is Portable Batch System (PBS).
It was created by NASA, and many clusters use it for scheduling.
A complete guide to using the PBS queue manager can be found in the
[PBS Professional<sup>&reg;</sup> User's Guide](https://pbsworks.com/pdfs/PBSUserGuide13.0.pdf).

{% include important.html content="Each PBS system has is set up slightly
differently in terms of the information that you need to pass to it. Ask
an administrator for an example *specific* to your system. The examples
provided here are based on the system I often work on." %}

# CPU Run Scripts {#CPU}
Run scripts, or jobfiles, contain all the necessary information to run a job.
An example is the `basher.sh` script (thanks, Alice!).
```bash
#/bin/bash
#PBS -q my_cpu_alloc              ## queue allocation
#PBS -l nodes=1:ppn=20,mem=20GB   ## 20 processors
#PBS -j oe                        ## same output and error file
#PBS -r n                         ## Job not re-runnable
#PBS -o err.error                 ## name of error file
#PBS -N WT_protein                ## name of job for queue

cd $PBS_O_WORKDIR

cat $PBS_NODEFILE  > $PWD/PBS_NODEFILE
module load amber/19-mvapich2

e=0
f=1
while [ $f -lt 11 ]; do

mpirun -np 20 -hostfile $PWD/PBS_NODEFILE $AMBERHOME/bin/pmemd.MPI -O -i mdin.$f \
-o WT_protein_system_wat_init$f.out \
-p WT_protein_system_wat.prmtop \
-c WT_protein_system_wat_init$e.rst \
-r WT_protein_system_wat_init$f.rst \
-x WT_protein_system_wat_init$f.mdcrd \
-ref WT_protein_system_wat_init$e.rst

e=$[$e+1]
f=$[$f+1]
done
```
The very first line specifies that it is a bash script (feel free to read more
    about that on [WikiBooks](https://en.wikibooks.org/wiki/Bash_Shell_Scripting)).
The next line specifies where the job should be run on the cluster (using CPUs).
The `#PBS -N` line is the job tagline to appear in the queue.
The `module load` line tells the cluster to locate the shared location for the
cluster's program.
In this case, instead of a local installation of AMBER18 in an individual's
home directory, the entire cluster can use the installed AMBER18.
The list of available modules can be checked through the `module avail` command.
Finally, the final lines specify that you want the script to run 10 times, with
structures 1-10, based on the appropriate `.mdin` file.
If you wanted to change that to structures 3-10, then the `e=0` line would
become `e=2`, and the `f=1` line would become `f=3`.
To actually run this script, you would need an appropriately named `.prmtop`
and an `init0.rst` file.
This file is just the original `.inpcrd` copied with a new name, since both are
AMBER7 restart files.

The next example is of a Gaussian 16 run script (thanks, Mark!).

{% include note.html content="To use Gaussian 09, mess with the commenting." %}

```bash
#!/bin/bash
#PBS -N My_Gauss_Job                ## name of job for queue
#PBS -j oe                          ## same output and error file
#PBS -o error.err                   ## name of error file
#PBS -q my_cpu_alloc                ## queue allocation
#PBS -l nodes=1:ppn=20,mem=20GB     ## 20 processors
#PBS -r n                           ## Job not re-runnable
#PBS -m abe                         ## Mail on abort, begin, error

## Go to the place you submit the job from
cd $PBS_O_WORKDIR

## input is the name of your job input without the file extension
## and ext is the file extension
## so this job is for test.gjf
## Old versions would resemble test.com
input=test
ext=gjf

#---------------------#
# SET JOB ENVIRONMENT #
#---------------------#
BaseScrDir=/scratch
PbsId=`echo ${PBS_JOBID} | cut -d "." -f1`
ScrDir=${BaseScrDir}/${USER}.${PbsId}

## Change following line to where you are at
cp $PBS_O_WORKDIR/$input.$ext $ScrDir
cd $ScrDir

## Gaussian 09 (uncomment if wanted)
#export g09root=/share/apps/GAUSSIAN/g09d01
#source $g09root/g09/bsd/g09.profile

## Gaussian 16 (comment if unwanted)
export g16root=/share/apps/GAUSSIAN/g16a03
source $g16root/g16/bsd/g16.profile

## Run the job
#time g09 < $input.$ext > $input.log
time g16 < $input.$ext > $input.log

## Bring the log file, checkpoint, and wavefunction files
## back to the place you submitted the job from
cp -r $ScrDir/$input.log $PBS_O_WORKDIR
cp -r $ScrDir/$input.chk $PBS_O_WORKDIR
#cp -r $ScrDir/$input.wfn $PBS_O_WORKDIR

exit 0
```
In this example, your input file is copied to the scratch directory to run the
job, and when the job is completed, the output files are returned to your home
directory.
This is done so that the calculations are not run on the head (login) node,
thereby saving you from being yelled at and receiving a temporary cluster ban.
To modify this script, change the `input` and `export` lines to match the file
name of the Gaussian input (either `.com` or `.gjf`), which can be generated in
Gaussview or [Avogadro](https://avogadro.cc/).

{% include note.html content="This Gaussian script is *very* PBS
system-specific. Sometimes it's a module. Sometimes you have a bunch of lines
like these.
Do *not* run Gaussian without a script unless your administrator has told
you to do so." %}

# GPU Run Script {#GPU}

There are not many differences between a script to run on GPUs versus CPUs,
other than specifying the actual location to run.
The following is an example of the `bashercuda.sh` AMBER script to run on GPUs
(thanks again, Alice!).

```bash
#!/bin/bash
#PBS -q my_gpu_alloc       ## queue allocation
#PBS -l nodes=n11-12-13    ## use this GPU node
#PBS -j oe                 ## same output and error file
#PBS -r n                  ## Job not re-runnable
#PBS -o err.error          ## name of error file
#PBS -N WT_protein         ## name of job for queue

export CUDA_VISIBLE_DEVICES=3

cd $PBS_O_WORKDIR

#module load amber/19-cuda_mvapich2
module load amber/19-cuda_serial
#export MV2_ENABLE_AFFINITY=0

e=0
f=1

while [ $f -lt 201 ]; do

#nohup mpirun --bind-to none -np 4 \
#-hostfile $PWD/PBS_NODEFILE
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
Like before, this script specifies a loop, to create MD files 1-200.
If you wanted to add a maximum job time of 12 hours (a requirement for some
    supercomputers), then add the line
```bash
#PBS -l walltime=11:59:59
```
to your input file, after the other `#PBS -l` line.
The reason why you shouldn't specify 12:00:00 for your run time is that the
queue sorts by the time limits, and this will place priority on your jobs.
An important thing to note in this script is that you specify the node
(`#PBS -l nodes=`) and the core (`export CUDA_VISIBLE_DEVICES=`) that you want
to run on, which can be verified through
[nvidia-smi](UNIXguide-nvidia-smi.html).
This example uses core 3 on node n11-12-13.

# R Script PBS Submission {#R-PBS}
[R](https://www.r-project.org/) is a programming language often used for data
processing and statistics.
Because our simulation analysis generate text files for single runs, it can be
helpful to average them across replicates, and R is a great choice for this
purpose.

On many clusters, several packages have been installed for all users, meaning
that they do not need to be locally installed.
To run R and access these packages, you need to first create a `~/.Renviron`
file with something like the following line:
```bash
R_LIBS=/share/apps/R/3.6.0/pkgs
```
As this is a hidden file that's sourced by the module, you only need to make it
once.

While most scripts with R are pretty simplistic, scripts that average huge
trajectories or perform a lot of math take up valuable computer memory.
Some packages also have a lot of overhead can also slow down a cluster for
other users.
Thus, these types of things (e.g., things that run with the tidyverse package
    or EDA averaging scripts) should be submitted through the queue using a
    script like:
```bash
#/bin/bash
#PBS -q my_cpu_alloc
#PBS -l nodes=1:ppn=1,mem=20GB
#PBS -j oe
#PBS -r n
#PBS -o R.error
#PBS -N R-test

cd $PBS_O_WORKDIR

module load R/3.6.0

Rscript name_of_actual_R_script.R
```

# qsub {#qsub}
Submitting jobs is done with the `qsub` command. To submit a jobfile named
`jobfile`, the command would simply be:
```bash
$ qsub jobfile
```
The jobfile has a string of information for running the job, and must include
the `\#!/bin/bash` line at the start.

Dependent submissions, i.e. job B needs the output from job A but job A isn't
finished and you want to submit job B right now going to sleep, can also be
accomplished.
To create a dependent job, first submit the first job with a normal
`qsub jobfile`.
That job will return a job ID (which can be checked through
    [qstat](UNIXguide-PBS.html#qstat)), which you'll need to submit the
    dependent job.
The dependency submission would follow:
```bash
$ qsub -W depend=afterok:12345 jobfile
```
where `12345` is the job ID of `job A` and `jobfile` is the jobfile of `job B`.

{% include note.html content="On some clusters, the job ID will show something
like `12345.my.address.org`; you only need the `12345` part." %}

If you need to run a job interactively (i.e. there are some command prompts you
    need to respond to within the job), then use
```bash
$ qsub -I -q my_cpu_alloc
```
which will allow you access a specific node. To leave interactive mode when the
job is finished, use `exit`.

# qstat {#qstat}

If you want to see what jobs you have running or waiting to run (queued jobs),
then use `qstat`.
Using `qstat` alone will show the jobs status for every single user within the
PBS manager.
To check the queue for a specific job, then you would need to do something like
```bash
$ qstat 1323523
```
where 1323523 is the job number that was given when the job was submitted.
Alternatively, to show just what you, a specific user, euid123, are running,
use `qstat -u euid123`.
The `-n` flag will give information about the specific computer node that your
simulation is running on.
Thus, your command could become `qstat -u euid123 -n`.
This is a very good command to create an [alias](UNIXguide-aliases.html) for.

# qdel {#qdel}

Sometimes you scream out in horror when you realize that you shouldn't have
submitted a job yet, or it's taking too long and you'd rather just kill it.
On PBS systems, this can be done with `qdel`.
Again, the job number will need to be added, so that it's practically look like:
```bash
$ qdel 1323523
```
where `1323523` is the job number that was given when the job was submitted.


{% include links.html %}
