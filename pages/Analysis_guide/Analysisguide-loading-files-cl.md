---
title: Files from the Command Line
sidebar: Analysis_sidebar
permalink: Analysisguide-loading-files-cl.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

VMD has been designed to operate from the command line.
This allows files to be loaded directly at start up.
The commands to load a prmtop file and an inpcrd file that have just been
generated would be:
```bash
$ vmd -parm7 name_of_file.prmtop -rst7 name_of_file.inpcrd
```

The `-parm7` flag signifies an AMBER7 prmtop and the `-rst7` flag signifies an
AMBER7 restart file.
Don't let the AMBER7 scare you--AMBER switched formats for prmtops and restarts
several years ago, and the name stuck around to mean anything file generated 
with or after AMBER7.
If you wanted to look at a trajectory that has not had `ioutfm` explicitly set
to 0 in the mdin files when working with AMBER16 (or later), then you would use:
```bash
$ vmd -parm7 name_of_file_wat.prmtop -netcdf name_of_file_wat_md25.mdcrd
```
or
for a restart file which has not had `ntxo` explicitly set to 1 in the mdin files
```bash
$ vmd -parm7 name_of_file_wat.prmtop -netcdf name_of_solvated_file_wat_md.rst
```
The `rst` file extension is just the last saved trajectory, and the `mdcrd`
file extension contains all of the trajectory information for that segment
(whose time frame changes based on the input settings).
NetCDF is a condensed standardized format, and is really what these files have
been saved as because that is the default, starting with AMBER16.
Previous editions of AMBER wrote the `mdcrd` and `rst` files in ASCII format,
and the flag to read those in would be `-crd`.
PDBs can be loaded with the the `-pdb` flag.


{% include links.html %}
