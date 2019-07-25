---
title: Using XSEDE's Comet
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-XSEDE-Comet.html
folder: UNIX_guide
---

Comet's IP address is `comet.sdsc.edu`.
Comet also uses a [SLURM](UNIXguide-SLURM.html) queue manager.
More information available on
[Comet's website](https://portal.xsede.org/sdsc-comet) or the
[Slurm website](https://slurm.schedmd.com/sbatch.html).
To use Comet, you need to have an XSEDE allocation and be added to a project.
To apply for an XSEDE account, visit the
[XSEDE User Portal](https://portal.xsede.org/my-xsede#/guest) and follow their
steps for account creation.
Then, email your XSEDE username to the person with the XSEDE allocation to be
added to a project.
It may take a few days between being added on the XSEDE portal to actually
being allowed to use the resources.

{% include tip.html content="One of the \"pro-tips\" for using Comet is to shave
a second off of your wallclock time. Think of how many people aren't doing this
but submitting jobs of the same wallclock time--that thought is how many people
you're jumping in the queue. Think like a computer!" %}

# CPU Run Scripts {#CPU}

An example CPU runscript for Comet is the `comet-cpu-jobfile.sh` script.
One of the new parts of this script is the `#SBATCH -A abc123` part.
What goes in place of `abc123` comes from using the `show_accounts` command on
Comet.
You're using this line to pick which allocation is charged system units
(XSEDE's computer currency) for running the job.
This was modified from Alice's Comet scripts to incorporate SLURM's environment
variables.
```bash
#!/bin/bash

#SBATCH -A abc123            # PI allocation
#SBATCH --nodes=2            # request 2 nodes
#SBATCH --tasks-per-node=24  # number CPU
#SBATCH -J WT-protein      # job name
#SBATCH -o amber.out         # output and error file name (%j expands to jobID)
#SBATCH -t 11:59:59          # run time (hh:mm:ss)
#SBATCH --export=ALL

## mkdir /oasis/scratch/comet/$USER/temp_project/
## NOTE: You should from this a directory off of the above path

#Set up the amber environment
module load amber/18

## The name of the directory that these files are in
## (used to copy mdinfo to your comet home directory)
prefix=WT_protein_system

## Copy the necessary files from the submission location
## to the place the job will run
cp $SLURM_SUBMIT_DIR/*.prmtop /scratch/$USER/$SLURM_JOBID
cp $SLURM_SUBMIT_DIR/*init0.rst /scratch/$USER/$SLURM_JOBID
cp $SLURM_SUBMIT_DIR/mdin* /scratch/$USER/$SLURM_JOBID

## Access the place to run the job
cd /scratch/$USER/$SLURM_JOBID

## Loop variables to restart calculation
## e=input, f=output
e=0
f=1
while [ $f -lt 4 ]; do

ibrun $AMBERHOME/bin/pmemd.MPI -O -i mdin.$f \
-o WT_protein_system_wat_init$f.out \
-p WT_protein_system_wat.prmtop \
-c WT_protein_system_wat_init$e.rst \
-r WT_protein_system_wat_init$f.rst \
-x WT_protein_system_wat_init$f.mdcrd \
-ref WT_protein_system_wat_init$e.rst

## if calculation will not finish within 48 hours, make sure to
## copy calculation so far to permanent scratch dir INSIDE loop
#cp -R /scratch/$USER/$SLURM_JOBID/* $SLURM_SUBMIT_DIR

## Puts time info in home directory
cp mdinfo $HOME/mdinfo.$prefix

e=$[$e+1]
f=$[$f+1]
done

## these lines copy the files into the submission directory
## after the calculation has finished--make sure to be within
## the wallclock time!
cp -R /scratch/$USER/$SLURM_JOBID/*md$f.out $SLURM_SUBMIT_DIR
cp -R /scratch/$USER/$SLURM_JOBID/*md$f.rst $SLURM_SUBMIT_DIR
cp -R /scratch/$USER/$SLURM_JOBID/*md$f.mdcrd $SLURM_SUBMIT_DIR
```

# GPU Run Scripts {#GPU}

An example GPU runscript for Comet is the `comet-gpu-jobfile.sh` script.
This was modified from Alice's Comet scripts to incorporate SLURM's
environment variables.
```bash
#!/bin/bash

#SBATCH --nodes=1          # request 1 node
#SBATCH -p gpu-shared      # queue (partition) -- normal, development, etc.
#SBATCH --gres=gpu:2       # resources you want to use (2 GPUs)
#SBATCH --tasks-per-node=2 # number GPUs
#SBATCH --export=ALL       # Keep the current environment stuff
#SBATCH -J 1DNA-5mrC       # job name
#SBATCH -A abc123          # PI allocation
#SBATCH -o amber.out       # output and error file name (%j expands to jobID)
#SBATCH -t 23:59:59        # run time (hh:mm:ss)

## if you want to submit to gpu rather than gpu-shared
## have number of gpus, tasks per node, and
## OMP_NUM_THREADS equal to 4

## Set up the job environment
module unload intel
module load amber/18
module load cuda

## Set number of threads, should equal number of GPUs
#export OMP_NUM_THREADS=2

## The name of the directory that these files are in
## (used to copy mdinfo to your comet home directory)
prefix=WT_protein_system

## Loop variables to restart calculation
## e=input, f=output
e=0
f=1

## All files should be located in the Lustre filesystem
## So, place them in:
## /oasis/scratch/comet/$USER/temp_project/$prefix

## Copy the necessary files from the submission location
## to the place the job will run
cp $SLURM_SUBMIT_DIR/*wat*.prmtop /scratch/$USER/$SLURM_JOBID
cp $SLURM_SUBMIT_DIR/*md$e.rst /scratch/$USER/$SLURM_JOBID
cp $SLURM_SUBMIT_DIR/mdin* /scratch/$USER/$SLURM_JOBID

## Access the place to run the job
cd /scratch/$USER/$SLURM_JOBID

while [ $f -lt 101 ]; do

ibrun $AMBERHOME/bin/pmemd.cuda.MPI -O -i mdin.4 \
-o WT_protein_system_wat_md$f.out \
-p WT_protein_system_wat.prmtop \
-c WT_protein_system_wat_md$e.rst \
-r WT_protein_system_wat_md$f.rst \
-x WT_protein_system_wat_md$f.mdcrd \
-ref WT_protein_system_wat_md$e.rst

## Puts time info in home directory
cp mdinfo $HOME/mdinfo.$prefix

## Puts output files into directory accessible outside of job
## Environment--MUST BE IN LOOP
cp /scratch/$USER/$SLURM_JOBID/*md$f.out $SLURM_SUBMIT_DIR
cp -R /scratch/$USER/$SLURM_JOBID/*md$f.rst $SLURM_SUBMIT_DIR
cp -R /scratch/$USER/$SLURM_JOBID/*md$f.mdcrd $SLURM_SUBMIT_DIR

e=$[$e+1]
f=$[$f+1]
done
```

{% include links.html %}
