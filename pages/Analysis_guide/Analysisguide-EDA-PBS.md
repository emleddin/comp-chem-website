---
title: EDA PBS Script
sidebar: Analysis_sidebar
permalink: Analysisguide-EDA-PBS.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

The following script can be used to run EDA on a
[PBS scheduler](UNIXguide-PBS.html).
The script can be amended to work with a different Fortran compiler
(here, Intel's ifort is used).

```bash
#/bin/bash
#PBS -q gac.cpu
#PBS -j oe
#PBS -r n
#PBS -o EDA.error
#PBS -N EDA-run-script

##Load in the Intel compiler
module load intel/17.0

##Access the folder where the files are
cd $PBS_O_WORKDIR

##Compile the EDA program
ifort Residue_E_Decomp_07_15.f90 -o Residue_E_Decomp_07_15.x

##Sleep for 5 seconds, ensuring that the program was compiled
sleep 5

##Run the program; read in the prompt answers  [Line 1: Name of input; Line 2: Name of prmtop]
./Residue_E_Decomp_07_15.x < ans.txt

##Acquire the process ID for the program execution
proc_PID=$!

##Wait until the program execution is over before ending the script
wait $proc_PID

echo "All done!"
```

A file named `ans.txt` is fed into the Fortran program.
Because the program is being run through the queue, the answers to the prompts
must be directly input into the program.
And example of the file is:
```
EDA-input.inp
solvated_complex.prmtop
```

If any comments are used in the `ans.txt` file, the program will not work.

{% include links.html %}
