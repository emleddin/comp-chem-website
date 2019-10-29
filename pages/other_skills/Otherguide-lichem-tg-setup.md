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


First, install Tinker7 on your machine from the [Tinker website](https://dasher.wustl.edu/tinker/).
While Tinker8 has been released, the use of the analyze command is different
than in Tinker7, and will generating the frozen atoms list more difficult.

# Converting the TINKER XYZ with LICHEM {#convert}
Once you have a Tinker XYZ file, create a `param.key` file that contains
only the line with the requisite Tinker force field information. It should
look something like:
```bash
parameters amber99.prm
```

{% include note.html content="You can edit generate one key file named
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

The `get-active.key`
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
Finally, the `sphere` line specifies the atom number offset by 1
(i.e., the atom in the XYZ file here we want is 3823) and the size of the
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
P1
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
generated." %}

Despite only listing `xyzfile.xyz`, `connect.inp`, and `regions.inp`, LICHEM
will look for other program-specific files including `BASIS` and `tinker.key`.
These files must be named accordingly.

{% include links.html %}