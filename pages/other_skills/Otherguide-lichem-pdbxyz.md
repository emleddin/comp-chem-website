---
title: Using PDBXYZ
sidebar: other_skills_sidebar
permalink: /Otherguide-lichem-pdbxyz.html
folder: other_skills
---

<!-- <link rel="stylesheet" href="css/theme-blue.css"> -->

LICHEM converts a TINKER XYZ file to a standard XYZ file. That means that a
PDB file would first need to be converted to a TINKER XYZ, which can be done
using `pdbxyz`.

`pdbxyz` is a program in the TINKER software package. Its usage is:
```bash
$ pdbxyz name_of_pdb.pdb -key tinker.key
```

Running this command with a complete PDB often causes issues.
One way to avoid these issues is to break up the PDB into several smaller PDBs
and convert them individually.
This is particularly critical for double-stranded nucleic acids, where each
strand needs to be in its own PDB file to convert correctly.
It is recommended that every location that a TER would be starts a new file
to convert, as well as adding in other new files.
So, one system could be broken into:
1. Protein
2. Non-standard residue
3. Substrate nucleic acid strand
4. Complement nucleic acid strand
5. Metal
6. Counterions
7. Water

After using `pdbxyz` on each of these individual files, all the files can be
combined into a single TINKER XYZ file using TINKER's `xyzedit`.

```bash
$ xyzedit name_of_protein.xyz -key tinker.key
```
This will bring up a list of options, one of which is  
`Append a second XYZ file to current one`.
Enter the number corresponding to this option (likely `18`) and then enter in
the next XYZ file in the order you'd like them to be appended.
Once you've finished choosing this option and file addition process, hit enter
without entering a new option.
The new, combined file will be named `name_of_protein.xyz_2`.

{% include links.html %}
