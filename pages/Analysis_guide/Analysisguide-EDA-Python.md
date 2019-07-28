---
title: Deprecated Python EDA Scripts
sidebar: Analysis_sidebar
permalink: Analysisguide-EDA-Python.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

These scripts are being left in the guides for historic reasons.
R is the much more clear-cut way to process these data.
{% include warning.html content="These scripts were written for an Anaconda
installation of Python3.6. Using Python2.7 __will not work__." %}

## Historic: EDA Results Analysis with awk & Python for Specific Residues {#EDA-awk}

An awk command (shown in a bash script here) can be used to separate out the
information for a specific residue of interest.

The following script pulls information for residues 436 and 444 from the
generated Fortran90 output, creating separated files for the Coulomb and van
der Waals energies for the individual residues.
The number of lines that each created file has is then listed in a color in the
Terminal where the script was executed.
The script can be run after making it executable with `chmod u+x awk.sh`.
Then, to run the script, use `./awk.sh`.

### awk.sh {#awk-script}
```bash
#!/bin/bash

#Template C modification
awk '{if ($2 == 436 || $3 == 436) print}' fort.803 > coul-436
awk '{if ($2 == 436 || $3 == 436) print}' fort.806 > vdw-436

#Complementary C modification
awk '{if ($2 == 444 || $3 == 444) print}' fort.803 > coul-444
awk '{if ($2 == 444 || $3 == 444) print}' fort.806 > vdw-444

CCOLOR='\033[1;33m' #Color for Coulomb terms is yellow
VCOLOR='\033[1;36m' #Color for VDW terms in blue
NC='\033[0m'

echo -e "coul-436 has ${CCOLOR}$(wc -l < coul-436)${NC} lines for NStep"
echo -e " vdw-436 has ${VCOLOR}$(wc -l < vdw-436)${NC} lines for NStep"
echo -e "coul-444 has ${CCOLOR}$(wc -l < coul-444)${NC} lines for NStep"
echo -e " vdw-444 has ${VCOLOR}$(wc -l < vdw-444)${NC} lines for NStep"

##Other color choices using ANSI escape codes:
#COLOR='\033[0;31m' #Red
#COLOR='\033[1;32m' #Light green; bright
#COLOR='\033[1;33m' #Yellow, bright
#COLOR='\033[33m'   #Yellow, standard
#COLOR='\033[0;34m' #Light blue
#COLOR='\033[1;36m' #Cyan, bright
#COLOR='\033[0;36m' #Cyan, standard
```

The following Python script, once edited to reflect the number of lines that
`awk.sh` registered, will find the Coulomb and van der Waals energies for the
individual residues by summing them together.
These sums will then be printed to the Terminal in color.
In order for this to run properly on a cluster, you'll need a local
installation of [Conda](https://www.anaconda.com/download/#linux).
Otherwise, to run the script, use `python coul-vdw.py`.

### `coul-vdw.py` {#coul-vdw}
```python
## Use with result files from EDA program and awk-Cres-nan.sh to extract out individual residues

import math        ## Remind Python that it can do math

## Use the numbers from awk-Cres-nan.sh output here
Nsteps_Ac = 473    ## coul-436
Nsteps_Av = 473    ## vdw-436
Nsteps_Bc = 473    ## coul-444
Nsteps_Bv = 473    ## vdw-444

## Coulomb for Residue A
ifile_Ac = open("coul-436", "r" )   ## Open the input file, coul-436, for reading

Esum_Ac = 0                         ## Set the energy sum as 0 to begin with

for i in range(Nsteps_Ac):          ## Loop for values for N rows of data, specified above
  dummy_Ac = ifile_Ac.readline()    ## Reads in line-by-line
  dummy_Ac = dummy_Ac.split()       ## Splits the data into columns
  Ei_Ac = float(dummy_Ac[3])        ## Returns floating point number; uses column 4 [start@0]
  Esum_Ac += Ei_Ac                  ## Appends values for Esum

## VDW for Residue A
ifile_Av = open("vdw-436", "r" )    ## Open the input file, vdw-436, for reading

Esum_Av = 0                         ## Set the energy sum as 0 to begin with

for i in range(Nsteps_Av):          ## Loop for values for N rows of data, specified above
  dummy_Av = ifile_Av.readline()    ## Reads in line-by-line
  dummy_Av = dummy_Av.split()       ## Splits the data into columns
  Ei_Av = float(dummy_Av[3])        ## Returns floating point number; uses column 4 [start@0]
  Esum_Av += Ei_Av                  ## Appends values for Esum


## Coulomb for Residue B
ifile_Bc = open("coul-444", "r")

Esum_Bc = 0

for i in range(Nsteps_Bc):
  dummy_Bc = ifile_Bc.readline()
  dummy_Bc = dummy_Bc.split()
  Ei_Bc = float(dummy_Bc[3])
  Esum_Bc += Ei_Bc

## VDW for Residue B
ifile_Bv = open("vdw-444", "r")

Esum_Bv = 0

for i in range(Nsteps_Bv):
  dummy_Bv = ifile_Bv.readline()
  dummy_Bv = dummy_Bv.split()
  Ei_Bv = float(dummy_Bv[3])
  Esum_Bv += Ei_Bv

## Get fancy with colors
from colorama import Fore
from colorama import Style

## Prints the floating point number for all values.
## Using colorama, you start print command with 'f' for coloration
print(f"Coulomb for RES 436 \t Esum = {Fore.YELLOW}{Style.BRIGHT} %f {Style.RESET_ALL} kcal/mol" %Esum_Ac)  ## Esum_Ac
print(f"VDW     for RES 436 \t Esum = {Fore.CYAN}{Style.BRIGHT} %f {Style.RESET_ALL} kcal/mol" %Esum_Av)    ## Esum_Av
print(f"Coulomb for RES 444 \t Esum = {Fore.YELLOW}{Style.BRIGHT} %f {Style.RESET_ALL} kcal/mol" %Esum_Bc)  ## Esum_Bc
print(f"VDW     for RES 444 \t Esum = {Fore.CYAN}{Style.BRIGHT} %f {Style.RESET_ALL} kcal/mol" %Esum_Bv)    ## Esum_Bv
```

## Historic: EDA Results Analysis: Plotting All Residues {#plot-all-res}
A more elaborate bash/Python script combination can be used to total the sums
for every residue and put them into convenient `coul-byres.dat` and
`vdw-byres.dat` files.

### `byres-EDA-generation.sh` {#byres-EDA-gen}
```bash
#!/bin/bash

#Start loop at 1
f=1

## Set up loop; the "-lt number" should be the number of protein residues +1
## i.e. here there's 455 residues before solvation WAT/K+
while [ $f -lt 456 ]; do

## Extract out per residue information from the f90 output
## The -v flag allows you to to define a variable in the command
## Here it's the previously defined f of the loop iteration
awk -v f=$f '{if ($2 == f || $3 == f) print}' fort.803 > coul-$f.tmp
awk -v f=$f '{if ($2 == f || $3 == f) print}' fort.806 > vdw-$f.tmp

f=$[$f+1]
done

## Run the python script
python coul-vdw-byres.py

## Remove the temp files created in the awk step
rm *.tmp

## Rename the output from python to include the current directory name
mv coul-byres.txt ${PWD##**/}-coul-byres.dat
mv vdw-byres.txt ${PWD##**/}-vdw-byres.dat
```

### `coul-vdw-byres.py` {#coul-vdw-byres}
```python
## Use with result files from EDA program and byres-EDA-generation.sh get plottable byres data

import math        ## Remind Python that it can do math

Nres = 455         ## Number of residues for analysis
Nsteps = Nres - 1  ## Number of residues for calculation
name = list(range(1,456))  ## From 1 to (but not including) 456

## Coulomb
ofile_c = open("coul-byres.txt", "w+")
for x in name:                                 ## Specifies the number of the input file
  ifile_c = open("coul-{}.tmp".format(x),"r")  ## Annoying syntax to get loop with input files
  Esum_c = 0                      ## Start the count at 0

  for i in range(Nsteps):         ## Loop for values for N rows of data
    dummy_c = ifile_c.readline()  ## Reads in line-by-line
    dummy_c = dummy_c.split()     ## Splits the data in columns

    ## This statement skips residues directly next to each other (ie 1&2, 2&3)
    ## Because they have crazy values and aren't just the Coul/VDW
    if int(float(dummy_c[1])) == (int(float(dummy_c[2])) - 1):
      continue
    else:
      Ei_c = float(dummy_c[3])      ## Returns the floating point number; uses column 4 [start@0]
      Esum_c += Ei_c                ## Appends values for Esum

  ifile_c.close()                 ## Close the opened input file to free up memory
  ofile_c.write ('%d \t %f \n' %(x,Esum_c)) ## Write the residue's energy
ofile_c.close()  ## Close the generated file to free up memory

## VDW
ofile_v = open("vdw-byres.txt", "w+")
count = 1
for x in name:
  ifile_v = open("vdw-{}.tmp".format(x),"r")
  Esum_v = 0

  for i in range(Nsteps):
    dummy_v = ifile_v.readline()
    dummy_v = dummy_v.split()
    if int(float(dummy_v[1])) == (int(float(dummy_v[2]))-1):
      continue
    else:
      Ei_v = float(dummy_v[3])
      Esum_v += Ei_v

  ifile_v.close()
  ofile_v.write ('%d \t %f \n' %(x,Esum_v))

ofile_v.close()
```

Once both scripts exist in the folder with the `fort.803` and `fort.806` files,
simply perform:
```bash
$ chmod u+x byres-EDA-generation.sh
$ ./byres-EDA-generation.sh
```
and generated files will be easily plotted using gnuplot (or another plotting
utility of your choice).

## Historic: Plotting By Residue Data in gnuplot {#res-data-gnu}
[Gnuplot](http://www.gnuplot.info/) is a freely available plotting utility.

The following (`EDA\_plot.gnu`) is an example gnuplot script that can be used
to generate graphs of the by-residue Coulomb and vdW energies of 4 different
systems.
This script would be in a directory that contained the directories of the
individual systems, which are then accessed individually in the plot command.
The number of residues should be changed in the `set xrange [0:500]` line to
reflect the number of residues of the protein.
```Gnuplot
set encoding iso_8859_1
set term postscript enhanced color font "Arial,24";


set xlabel "Residue number"
set ylabel "Coulomb Energy (kcal/mol)"
set xrange [0:500]
set key bottom left Left reverse width 2 height 1

set output "coulomb.eps";
plot "system-1/system-1-coul-byres.dat" u 1:2 w boxes t  "System 1" lw 4, \
"system-2/system-2-coul-byres.dat" u 1:2 w boxes t  "System 2" lw 4, \
"system-3/system-3-coul-byres.dat" u 1:2 w boxes t "System 3" lw 4, \
"system-4/system-4-coul-byres.dat" u 1:2 w boxes t "System 4" lw 4;

set xlabel "Residue number"
set ylabel "vdW Energy (kcal/mol)"
set key top left Left reverse width 2 height 1

set output "vdw.eps";
plot "system-1/system-1-vdw-byres.dat" u 1:2 w boxes t  "System 1" lw 4, \
"system-2/system-2-vdw-byres.dat" u 1:2 w boxes t  "System 2" lw 4, \
"system-3/system-3-vdw-byres.dat" u 1:2 w boxes t "System 3" lw 4, \
"system-4/system-4-vdw-byres.dat" u 1:2 w boxes t "System 4" lw 4;
\end{lstlisting}

To run the gnuplot script and generate the plots, use:
\begin{lstlisting}[style=P1]
$ gnuplot EDA_plot.gnu
```

## Historic: EDA Results Analysis: Plotting the Interactions of a Single Residue {#bashbyres}

An bash script consisting of a series of awk commands can be used to extract
out the matches for a single residue of interest and prepare them for plotting
with [Gnuplot](http://www.gnuplot.info/).
This script will go through and set the values for the two adjacent residues to
zero, as their interactions are affected by stuff like dihedral angles.

### `bashbyres.sh` {#bashbyres-script}
```bash
#!/bin/bash


## Prints just the interactions of 1&f, 2&f....
## Set f as the residue of interest, and this should do the rest :D
f=436
g=$[f+1]
e=$[f-1]

## First pass at Coulomb interaction
awk -v f=$f '{if ($2 == f) printf "%8s %5s %22s %22s\n", $1, $3, $4, $5}' fort.803 > coul-$f-byres.tmp
awk -v f=$f '{if ($3 == f) printf "%8s %5s %22s %22s\n", $1, $2, $4, $5}' fort.803 >> coul-$f-byres.tmp

## First pass at vdW interaction
awk -v f=$f '{if ($2 == f) printf "%8s %5s %22s %22s\n", $1, $3, $4, $5}' fort.806 > vdw-$f-byres.tmp
awk -v f=$f '{if ($3 == f) printf "%8s %5s %22s %22s\n", $1, $2, $4, $5}' fort.806 >> vdw-$f-byres.tmp


## Coulomb interaction

## Setting the adjacent residues to zero because they aren't just C/vdW
## Adjust the column with value for both adjacents
awk -v var1=$g -v f=$f '$2==var1{$3="0"} {printf "%8s %5s %22s %22s\n", $1, $2, $3, $4}' coul-$f-byres.tmp > coul-$f-byres.tmp2

mv coul-$f-byres.tmp2 coul-$f-byres.tmp

awk -v var2=$e -v f=$f '$2==var2{$3="0"} {printf "%8s %5s %22s %22s\n", $1, $2, $3, $4}' coul-$f-byres.tmp > coul-$f-byres.tmp2

mv coul-$f-byres.tmp2 coul-$f-byres.tmp

## Adjust the column with standard energy for both adjacents

awk -v var1=$g -v f=$f '$2==var1{$4="0"} {printf "%8s %5s %22s %22s\n", $1, $2, $3, $4}' coul-$f-byres.tmp > coul-$f-byres.tmp2

mv coul-$f-byres.tmp2 coul-$f-byres.tmp

awk -v var2=$e -v f=$f '$2==var2{$4="0"} {printf "%8s %5s %22s %22s\n", $1, $2, $3, $4}' coul-$f-byres.tmp > coul-$f-byres.tmp2

mv coul-$f-byres.tmp2 coul-$f-byres.tmp && mv coul-$f-byres.tmp coul-$f-byres

## Sort by the value numerically so gnuplot doesn't get interesting...
sort -k2,4n coul-$f-byres > coul-$f-byres.tmp
mv coul-$f-byres.tmp ${PWD##**/}-coul-$f-res.dat

## vdW interaction

## Setting the adjacent residues to zero because they aren't just C/vdW
awk -v var1=$g -v f=$f '$2==var1{$3="0"} {printf "%8s %5s %22s %22s\n", $1, $2, $3, $4}' vdw-$f-byres.tmp > vdw-$f-byres.tmp2

mv vdw-$f-byres.tmp2 vdw-$f-byres.tmp

awk -v var2=$e -v f=$f '$2==var2{$3="0"} {printf "%8s %5s %22s %22s\n", $1, $2, $3, $4}' vdw-$f-byres.tmp > vdw-$f-byres.tmp2

mv vdw-$f-byres.tmp2 vdw-$f-byres.tmp

awk -v var1=$g -v f=$f '$2==var1{$4="0"} {printf "%8s %5s %22s %22s\n", $1, $2, $3, $4}' vdw-$f-byres.tmp > vdw-$f-byres.tmp2

mv vdw-$f-byres.tmp2 vdw-$f-byres.tmp

awk -v var2=$e -v f=$f '$2==var2{$4="0"} {printf "%8s %5s %22s %22s\n", $1, $2, $3, $4}' vdw-$f-byres.tmp > vdw-$f-byres.tmp2

mv vdw-$f-byres.tmp2 vdw-$f-byres.tmp && mv vdw-$f-byres.tmp vdw-$f-byres

sort -k2,4n vdw-$f-byres > vdw-$f-byres.tmp
mv vdw-$f-byres.tmp ${PWD##**/}-vdw-$f-res.dat
```

Once the script exist in the folder with the `fort.803` and `fort.806` files,
simply perform:
```bash
$ chmod u+x bashbyres.sh
$ ./bashbyres.sh
```
and generated files will be easily plotted using gnuplot (or another plotting
utility of your choice).

### Historic: Plotting A Single Residue's Data in gnuplot
[Gnuplot](http://www.gnuplot.info/) is a freely available plotting utility.

The following (`EDA_plot.gnu`) is an example gnuplot script that can be used to
generate graphs of the by-residue Coulomb and vdW energies for a single residue
in the system.
This script would be in a directory that contained the directories of the
individual systems, which are then accessed individually in the plot command.
The number of residues should be changed in the `set xrange [0:500]` line to
reflect the number of residues of the protein.
```Gnuplot
set encoding iso_8859_1
set term postscript enhanced color font "Arial,24";

set xlabel "Residue number"
set ylabel "Coulomb Energy (kcal/mol)"
set xrange [0:500]
set key bottom left Left reverse width 2 height 1

#For points use "w points" instead of "w boxes" (boxplots)
#For lines use "w lines"

set title "Coulomb Interactions for Residue X"
set output "coulomb-436-system1.eps";
plot "system1/system1-coul-436-res.dat" u 2:($3) w boxes t "System1" lw 4;

set xlabel "Residue number"
set ylabel "vdW Energy (kcal/mol)"
set key top left Left reverse width 2 height 1

set title "van der Waals Interactions for Residue X"
set output "vdw-436-system1.eps";
plot "system-1/system-1-vdw-436-res.dat" u 2:($3) w boxes t "System 1" lw 4;
```

To run the gnuplot script and generate the plots, use:
```bash
$ gnuplot EDA_plot.gnu
```

### Historic: Plotting a Difference Between 2 Systems at a Single Residue in gnuplot {#byresEDAplot}

The following (`EDA_plot_subtraction.gnu`) is an example gnuplot script that
can be used to generate graphs of the by-residue Coulomb and vdW energies for
the difference between two systems at a single residue.
The example residue here is `436`.

Before this script is run, you'll need to use the `paste` command to combine
data together into columns.
The data that should be combined comes from
`bashbyres.sh` (see [above](Analysisguide-EDA-Python.html#bashbyres)).

For the Coulomb data, use something like:
```bash
$ paste WT/resid436/resid436-coul-436-res.dat MUT-A/resid436/resid436-coul-436-res.dat MUT-B/resid436/resid436-coul-436-res.dat MUT-C/resid436/resid436-coul-436-res.dat > combodata-coul-WT-res436.dat
```

For the vdW data, use something like:
```bash
$ paste WT/resid436/resid436-vdw-436-res.dat MUT-A/resid436/resid436-vdw-436-res.dat MUT-B/resid436/resid436-vdw-436-res.dat MUT-C/resid436/resid436-vdw-436-res.dat > combodata-vdw-WT-res436.dat
```

```Gnuplot
#paste WT/resid436/resid436-coul-436-res.dat MUT-A/resid436/resid436-coul-436-res.dat MUT-B/resid436/resid436-coul-436-res.dat MUT-C/resid436/resid436-coul-436-res.dat > combodata-coul-WT-res436.dat

#paste WT/resid436/resid436-vdw-436-res.dat MUT-A/resid436/resid436-vdw-436-res.dat MUT-B/resid436/resid436-vdw-436-res.dat MUT-C/resid436/resid436-vdw-436-res.dat > combodata-vdw-WT-res436.dat

set encoding iso_8859_1
set term postscript enhanced color font "Arial,24";

set xlabel "Residue number"
set ylabel "Coulomb Energy (kcal/mol)"
set xrange [0:455]

set key bottom left Left reverse width 2 height 1

## WT - MUT A  ##

set output "coulomb-WT-MUTA-res436.eps";
plot "combodata-coul-WT-res436.dat" u 2:($3-$7) w boxes t  "WT - MUT A" lw 4;

set xlabel "Residue number"
set ylabel "vdW Energy (kcal/mol)"
set key top left Left reverse width 2 height 1

set output "vdw-WT-MUTA-res436.eps";
plot "combodata-vdw-WT-res436.dat" u 2:($3-$7) w boxes t  "WT - MUT A" lw 4;

## WT - MUT B ##
set xlabel "Residue number"
set ylabel "Coulomb Energy (kcal/mol)"

set output "coulomb-WT-MUTB-res436.eps";
plot "combodata-coul-WT-res436.dat" u 2:($3-$11) w boxes t  "WT - MUT B" lw 4;

set xlabel "Residue number"
set ylabel "vdW Energy (kcal/mol)"
set key top left Left reverse width 2 height 1

set output "vdw-WT-MUTB-res436.eps";
plot "combodata-vdw-WT-res436.dat" u 2:($3-$11) w boxes t  "WT - MUT B" lw 4;

## WT - MUT C ##
set xlabel "Residue number"
set ylabel "Coulomb Energy (kcal/mol)"

set output "coulomb-WT-MUTC-res436.eps";
plot "combodata-coul-WT-res436.dat" u 2:($3-$15) w boxes t  "WT - MUT C" lw 4;

set xlabel "Residue number"
set ylabel "vdW Energy (kcal/mol)"
set key top left Left reverse width 2 height 1

set output "vdw-WT-MUTC-res436.eps";
plot "combodata-vdw-WT-res436.dat" u 2:($3-$15) w boxes t  "WT - MUT C" lw 4;
```

## Historic: Plotting Side-by-Side Datasets in gnuplot {#side-by-side-gnu}
You may want to plot the energies of two systems side-by-side.
This can get really messy, since your number of residues is then doubled.
It takes a math-based work around to force gnuplot to do this, so an example
script has been included here.
```Gnuplot
reset
dx=1.
n=2
total_box_width_relative=1.
gap_width_relative=0
d_width=(gap_width_relative+total_box_width_relative)*dx/2.
reset

set encoding iso_8859_1
set term pngcairo enhanced color font "Arial,30" size 1500,1050;

set output "coulomb_1-2.png";

set xlabel "Residue number"
set ylabel "Coulomb Energy (kcal/mol)"
set xrange [0:455]

set boxwidth total_box_width_relative/n relative
set style fill solid 0.8 noborder

set xtics ("1130" 0, "1180" 50, "1230" 100, "1280" 150, "1330" 200, "1380" 250, "1430" 300, \
     "1845" 350, "1895" 400) border nomirror out; #"" 334, "" 346, "" 431
set x2tics border nomirror out rotate by 15 ("DNA" 431, "" 451) #

set arrow 1 from first 334,-39 to first 346,-39 lw 2 nohead
set arrow 2 from first 334,-40 to first 334,-38 lw 1 nohead
set arrow 3 from first 346,-40 to first 346,-38 lw 1 nohead
set label "Linker" at 310,-44 font ",20"

set key top right Right width 2 height 1 font ",20"

#System One
#System Two
plot "system-one-avg_EDA_coul-clean-nocolon.txt" u ($1):2 w boxes t "System One" lc rgb "#0000FA", \
"system-two-avg_EDA_coul-clean-nocolon.txt" u ($1+d_width):2 w boxes t "System Two" lc rgb "#FA7D00";
```

<!-- ADD AN EXAMPLE IMAGE  -->

## Historic: Plotting Side-by-Side Datasets in matplotlib {#side-by-side-mpl}
Sometimes people don't like the side-by-side variant made using gnuplot.
You then spend several hours trying to make them have thicker lines or what
have you by using a different plotting program.
Now there's a script for a barchart with two datasets generated using
[matplotlib](https://matplotlib.org/).
```python
import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
import statsmodels.api as sm
import pandas as pd
from tables import *

x1, y1 = np.loadtxt("../system-one-avg_EDA_total.txt",unpack=True,delimiter='\t')
x2, y2 = np.loadtxt("../system-two-avg_EDA_total.txt",unpack=True,delimiter='\t')

plt.rcParams.update({'font.size': 24})
plt.rcParams.update({'figure.autolayout': True})

labelsx2 = [1130, 1180, 1230, 1280, 1330, 1380, 1430, 'Linker', '', 1895, '       DNA']
placesx2 = [0, 50, 100, 150, 200, 250, 300, 333, 347, 400, 430]

n_residues = 455
index = np.arange(n_residues)
bar_width = 0.5

fig = plt.gcf()
#fig.set_size_inches(11,8.5)
fig.set_size_inches(22,17)

#111 = 1 row x 1 column x 1 index
ax = plt.subplot(111)
ax.axes.get_xaxis()
ax.set_xticks(index + bar_width / 2)
ax.set_xticks(placesx2)
ax.set_xticklabels(labelsx2, fontdict=None, minor=False)
ax.set_xlim(0,456)
ax.tick_params(axis='both', which='major', pad=10, length=10)
systone = ax.bar(index, y1, bar_width, color='#0000FA',align='center',label='system one')
systtwo = ax.bar(index + bar_width, y2, bar_width, color='#FA7D00',align='center',label='system two')
plt.ylabel('Energy (kcal/mol)')
plt.xlabel('Residue Number')
plt.legend(handles=[systone,systtwo])
plt.savefig('system_total_barchart.png')
plt.close('system_total_barchart.png')
```

{% include note.html content="You'll want to change `nresidues` and the
`labelx2` and `placesx2` categories to reflect your system. The labels
specified for `systone` and `systtwo` (which are dummy variables, you can make
them whatever you want, really) are what appear in the graph legend.
The two specified colors, `#0000FA` and `#FA7D00`, are blue and orange,
respectively." %}

<!-- ADD AN EXAMPLE IMAGE -->

## Historic: Plotting Multiple Datasets using gnuplot's Multiplot Feature {#mutliple}
You can use the multiplot feature to make stacked graphs.

```Gnuplot
set encoding iso_8859_1
#set term postscript enhanced color font "Arial,24";
set term pngcairo enhanced color font "Arial,30" size 1500,1050;

#### STACKED PLOTS ######

set output "coulomb_stacked_yoffset.png";
set tmargin 0
set bmargin 0
set lmargin 1
set rmargin 1
unset xlabel
set ylabel "Coulomb Energy (kcal/mol)" offset 0,-4

unset arrow 1
unset arrow 2
unset arrow 3
unset label

#Ask for 3, use 2
#set multiplot layout 3,1 margins 0.05,0.95,.1,.99 spacing 0,0
set multiplot layout 2,1 margins 0.12,0.94,0.15,0.88 spacing 0,0
#set multiplot layout 2,1 margins 0.12,0.88,0.15,0.85 spacing 0,0

unset xtics
set yrange[-80:60]
set ytics ("" -80,-60,-40,-20,0,20,40,60) nomirror

set key autotitle column nobox samplen 1 noenhanced
set style data boxes
set x2tics border nomirror in out ("GS Linker" 334, "" 346,"DNA" 431, "" 451)

#System One
plot "system-one-avg_EDA_coul-clean-nocolon.txt" u ($1):2 w boxes t "System One" lc "medium-blue"

unset ylabel
unset x2tics
set x2tics border nomirror in out ("" 334, "" 346,"" 431, "" 451) #"" 334, "" 346,
set xlabel "Residue number"
set xtics ("1130" 0, "1180" 50, "1230" 100, "1280" 150, "1330" 200, "1380" 250, "1430" 300, \
     "1845" 350, "1895" 400) border nomirror out;
set ytics (-80, -60,-40,-20,0,20,40, "" 60) nomirror

#System Two
plot "system-two-avg_EDA_coul-clean-nocolon.txt" u ($1):($2) w boxes t "System Two" lc "dark-orange"

unset multiplot
```

<!-- ADD AN EXAMPLE IMAGE  -->

{% include links.html %}
