---
title: File Types
sidebar: AMBER_sidebar
permalink: AMBERguide-filetypes.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

* `pdb`: the Protein Data Bank file. More information is available in the
[PDB files section](AMBERguide-PDBs.html).

* `prepi`: an AMBER PREP internal coordinate file. This is one file which
allows non-standard residues to be added to the AMBER database for your
simulation. More specific information is available in
[the AMBER documentation](http://ambermd.org/doc/prep.html).

* `mol2`: the Tripos Mol2, printed in ASCII format, that was developed for
molecular visualization. It contains information about the atom (including
    coordinates and charges), in addition to bonds and any relevant aspects
    of the structure.

* `frcmod`: modified force filed parameters. These are critically important for
non-standard residues.

* `lib`: an OFF library file containing information about non-standard
residues. The generation of this file is preferred for larger co-enzymes,
instead of other treatments for non-standard residues. More specific
information is available in
[the AMBER documentation](http://ambermd.org/doc/OFF_file_format.txt).

* `mdin`: input files that control simulation conditions and settings for data
collection.

* `prmtop`: the molecular topology file.

* `inpcrd`: coordinate files. These are preferred by *parm* and *LEaP*, but is
almost equal to an `rst`.

* `rst`: restart files that contain information about the last frame's energy
minimization or molecular dynamics information from *sander* or *gibbs*. They
get their name from being used to restart a simulation from them, instead of
starting from the beginning again.

* `mdcrd`: a trajectory file. These contain information on coordinates
throughout the course of the simulation.

* `nc`: a NetCDF file. While the manuals/guides I've written tend talk about
this as a file generated after *cpptraj* processing, it's really just anything
written in NetCDF. Technically, then, everything generated with or after
AMBER16 using an [mdin](AMBERguide-mdins.html) file without `ntxo=1`
(for ASCII rst files) and `ioutfm=0` (for ASCII mdcrd files) should have the
`nc` extension for both trajectory and restart information. That said, the
default to NetCDF was a recent change, and people using the former `mdcrd`
extension may not have changed their naming to the `nc` extension.

{% include links.html %}
