---
title: Set-Up Using Tinker and Gaussian
sidebar: other_skills_sidebar
permalink: /Otherguide-lichem-tg-setup.html
folder: other_skills
---

<!-- <link rel="stylesheet" href="css/theme-blue.css"> -->

{% include warning.html content="This page is under development and the
information contained herein may not be a complete representation of the
set-up process." %}


First, install Tinker7 on your machine from the
[Tinker website](https://dasher.wustl.edu/tinker/).
While Tinker8 has been released, the use of the analyze command is different
than in Tinker7, and will make generating the frozen atoms list more difficult.

{% include tip.html content="If you have multiple versions of Tinker installed,
export a global variable to the bin of each edition name. Bash shell example:
`export Tinker7=/home/$USER/bin/tinker7/bin` and then call the program with
`$Tinker7/xyzedit`." %}

# Converting the TINKER XYZ with LICHEM {#convert}
Once you have a Tinker XYZ file, create a `param.key` file that contains
only the line with the requisite Tinker force field information. It should
look something like:
```bash
parameters amber99.prm
```

{% include note.html content="You can generate one key file named
`tinker.key` and update the information therein, but for the purposes of
this explanation, every key file with new information will be explicitly
named." %}

Now, use LICHEM to convert these to the necessary format.

```bash
lichem -convert -t my_tinker_system.xyz -k param.key > conversion-1.log
```

This conversion created several new files: `regions.inp`, `connect.inp`, and
`xyzfile.xyz`.

The original regions file looks like this:
```bash
QM_atoms: 0
Pseudobond_atoms: 0
Boundary_atoms: 0
Frozen_atoms: 0
```

In this file, list the `QM_atoms`, `Pseudobond_atoms`, and `Frozen_atoms`.
This definition includes the keyword, then the number of total atoms in that
category, followed by each individual index number of the atoms in that
category. This indexing starts with the first atom being `0`--the same as
VMD's indexing, but __not__ the same as the Tinker XYZ file.

For example, a system with 5 QM atoms would look like:
```bash
QM_atoms: 5
101 107 110 591 3822
```

{% include tip.html content="Try to list atoms in rows of 10. It will make
it easier to determine which atoms need unique basis sets when they are
renumbered in later steps." %}

Once defined, save the `regions.inp` and create a backup (e.g., `qm_list.txt`)
so that you do not lose this information in the future.

# Generate List of "Active" Atoms {#active}

Once the QM, boundary, and pseudobond atoms have been defined, the list of
frozen atoms needs to be generated.
This is done by specifying a sphere around a specific atom.
Tinker7 can generate this list, but it needs some specific information in the
key file.

The `get-active.key`:
```bash
parameters amber99sb.prm
neutral-groups
debug
sphere 3822 15
```
The `get-active.key` file starts with the specific parameter file that
corresponds to the XYZ.
Charge-charge interaction distances are addressed through `neutral-groups`, and
`debug` prints the detailed information that contains the active atoms.
Finally, the `sphere` line specifies the atom number in the Tinker XYZ
(i.e., the atom in the XYZ file here we want is 3822) and the size of the
sphere in angstroms.

While we're generating keys, copy the `param.key` file as `active_tinker.key`.
This will be used after the analyze step.
```bash
$ cp param.key active_tinker.key
```

Once those keys are written, run `analyze` with Tinker7 and the
`get-active.key` to get the list.
```bash
analyze my_tinker_system.xyz -key get-active.key
> active atoms 1835
```
You can exit the program after it prints the first set of information.
All you need is the list of active atoms that is printed initially
(` List of Active Atoms for Energy Calculations :`)
Copy that list into the previously created `active_tinker.key` file after
the parameter line.

Each of these lines needs to be specified as `active` for TINKER.
This can be accomplished by using `sed` to edit the file.
These lines with remove the tabs and then start each line with `active`.
```bash
$ sed -i -e 's/[ \t]*//' active_tinker.key
$ sed -i 's/^/active /' active_tinker.key
```
After using `sed`, edit the `active_tinker.key` file to remove the `active`
on the `parameters` line.

Now, use this to add the frozen atoms to the regions file.
{% include warning.html content="This WILL delete the QM, boundary, and
pseudobond atoms in the `regions.inp` file, so make sure those are saved
in a backup file!!!" %}
```bash
lichem -convert -t my_tinker_system.xyz -k active_tinker.key > conversion-2.log
```

After the frozen atoms have been added to the regions file, re-add the list of
QM, boundary, and pseudobond atoms.
The boundary atoms also __need__ to be repeated in the `Frozen_atoms` section.
So, if the new `regions.inp` file contains 100 frozen atoms, and you specify
2 boundary atoms, you need to change it to 102 frozen atoms and add those
2 boundary atoms to the long list.

# Add Keywords to the Regions File {#reg}

It is now time to add the LICHEM-specific keywords.
An example of some are listed below:
```bash
Potential_type: QMMM
QM_type: Gaussian
QM_method: B3LYP
QM_basis: GEN
QM_memory: 80 GB
QM_charge: -5
QM_spin: 2
MM_type: TINKER
Electrostatics: CHARGES
Calculation_type: DFP
Opt_stepsize: 1.00
Max_stepsize: 0.10
QM_opt_tolerance: 1e-3
MM_opt_tolerance: 1e-1
Max_opt_steps: 50
Init_path_chk: No
PBC: Yes
Box_size: 81.865 102.353 92.1
Use_LREC: Yes
LREC_cut: 25.0
Use_Ewald: Yes
Keep_files: Yes
```

The `Calculation_type` of `DFP` performs a Davidon-Fletcher-Powell optimization.
It is recommended that the system first be tested using `SP` (for single-point)
and ensuring that the energy is negative before continuing with `DFP`.
Doing this first can help to debug problems that would arise in the
longer calculation.

Using `GEN` for `QM_basis` means that the basis set information will be
described in a separate file (named `BASIS` and described later).

The `box_size` information is system-specific. If you do not know your box
size, and it was converted from an AMBER PDB, you can find that using Python
as shown in the following code.
```python
>>> import parmed as pmd
>>> pdb = pmd.load_file(‘my_original_system.pdb’)
>>> pdb.get_box()
array([[81.865, 102.353, 92.1, 90., 90., 90. ]])
```
For this, the first three numbers, BoxX, BoxY, and BoxZ are used
(__NOT__ alpha, beta, and gamma).


# Generate BASIS File {#basis}

As mentioned, a `BASIS` file contains all of the basis set information to be
used with Gaussian.
LICHEM can generate this file with:
```bash
lichem -convert -b regions.inp
```

For the `BASIS` file, the numbers are based on the numerical order of what is
listed in QM and pseudobonds sections of `regions.inp`.
This means that if you have numbers `1123 1433 1353` listed in different places
in the file, 1123 = 1, 1353 = 2, and 1433 = 3.
As long as the referenced number is correct, you can mix and match each line
(ex: `1 3 5` for `6-31G` & `2 4 6 7 8` for `6-31+G**`).

The format for the file looks like:
```bash
#1 #2 #3__0
GEN
****
```
There are 2 spaces between the last number and the zero.

Some examples of basis sets to put in the place of `GEN` include:
- STO-3G
    - STO-3G*
- 3-21G
- 3-21+G
    - 3-21+G*
    - 3-21+G**
- 6-31G
    - 6-31G*
    - 6-31G**
- 6-31++G
    - 6-31++G*
    - 6-31++G**
- 6-311G
- 6-311+G
- 6-311++G

You'll likely have to benchmark these for your system, as well as read the
literature for the things that tend to work well for your system.

The pseudopotential information (for the pseudobonds) is listed at the end.
The following uses fluorine for atoms 1, 8, 15, and 25.
```bash
1 8 15 25 0 STO-2G
SP 2 1.00
0.9034 1.00 1.00
0.21310 1.90904 0.57864
****

1 8 15 25 0
try1 1 2
S Component
1
1 7.75 16.49
P
1
1 1.0 0.0

```

# Running LICHEM {#calc}

After the `BASIS` file has been written, LICHEM can now be run with Gaussian
and TINKER.
The following command will use 20 processors to do so.

```bash
## -n number of processors
## -x input xyz
## -c connectivity file
## -r regions file
## -o output xyz file
## -l output log file
lichem -n 20 -x xyzfile.xyz -c connect.inp -r regions.inp -o
system_out.xyz -l system_out.log
```

{% include note.html content="The `xyzfile.xyz` is the one that LICHEM
generated with `lichem-convert`. A regular, non-Tinker XYZ can also be used
if you have previously generated the `connect.inp` file and the numbering
is the same between them." %}

Despite only listing `xyzfile.xyz`, `connect.inp`, and `regions.inp`, LICHEM
will look for other program-specific files including `BASIS` and `tinker.key`.
These files must be named accordingly.

# Troubleshooting {#helpme}

There are a number of log files that are saved with a LICHEM job.
An error could be documented in one of them, but not all of them, so it is
important to look through them thoroughly.
To put this another way, if it fails in one program, it will try to continue
in another program, and errors may be in one log, but not the other.
In a perfect world, you'll get convergence in the QM, normal termination in the
MM, and a complete optimization for QM/MM.

## Bad Box Information {#badbox}

When using LICHEM with periodic boundary conditions, the box size is given in
the `regions.inp` file.
However, if that box information is incorrect, the QM region may not converge
because of it literally being spread across the box.
The final XYZ generated by LICHEM will visibly look wrong when visualized.

Sometimes, incorrect box sizes will be accompanied by
`Annihilation of the first spin contaminate:` in the `LICHM_GaussForce_0.log`
file.

However, there is a chance that the physical size of the box is correct, but
for some reason the system is not centered within the box.
This can be addressed by using TINKER's `xyzedit` on the original TINKER xyz
and selecting the `Translate Center of Mass to the Origin` option.
Then, reconvert the TINKER xyz to the LICHEM xyz.

If you're working with an AMBER system, you can do this using the `center`
command in *cpptraj*, before writing out the specific frames.
The command uses and atom mask (you typically select what isn't solvent or
counterions).
```bash
center :1-455 origin mass
```

You can also use MDAnalysis to translate the center of mass to the origin.
```python
import MDAnalysis as mda

pdb = "my_system.pdb"
out_pdb = "my_centered_system.pdb"

system = mda.Universe(pdb)

## Translate all the atoms to the origin
new = system.atoms.translate(-system.select_atoms('all').center_of_mass())

## Writes out the PDB with COM at origin
new.atoms.write(out_pdb)
```

Each of these ways will vary slightly in their significant figures for the
coordinates, and thus impact the final energies.
Therefore, be consistent with what you use!

## Connection Through Boundary {#badbound}

If you're trying to use the side chains of two residues that are next to each
other, then you may get the following message:
```
Error: Two pseudo-bonds are connected through boundary atoms!!! The connections prevent LICHEM from correctly updating the charges.
```

Like the message says, LICHEM complains about two pseudobonds being connected
by boundary atoms.
So, consider including the entirety of those two residues and cutting the
backbone halfway on each side.

## BASIS Issue {#badbasis}

The BASIS file that is read by Gaussian is numbered using the `QM_atoms` and
`Pseudobond_atoms` starting with `1`.
If you have used an number in both the QM and pseudobond atom lists in the
`regions.inp` file, or you have written a basis set incorrectly, you will
likely get this error in your Gaussian output:
```
The center is too long.
```

## Using a VMD-generated XYZ {#fromVMD}

If you've used VMD to save a starting XYZ for LICHEM (a true XYZ, not a Tinker
XYZ), then there will be a default line written under the number of atoms.

```
8148
 generated by VMD
 N         2.990000       39.410000       20.542000
```

Having that line (even if it's blank) will result in an error with
`Name of the center is too long` being printed to the Gaussian output file.

If the error persists, remove the extra whitespace at the beginning of each
line using [`sed`](UNIXguide-sed.html).
```bash
$ sed ’s/^ *//‘ xyzfile_from_vmd.xyz > xyzfile_for_lichem.xyz
```

{% include links.html %}
