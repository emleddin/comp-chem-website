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


First, install Tinker7 on your machine from the [Tinker website][https://dasher.wustl.edu/tinker/].
While Tinker8 has been released, the use of the analyze command is different
than in Tinker7, and will generating the frozen atoms list more difficult.

# Converting the TINKER XYZ with LICHEM
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
lichem -convert -t my_tinker_system.xyz -k tinker.key > conversion-1.log
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

# Generate List of "Active" Atoms

```bash
parameters amber99.prm
neutral-groups
debug
sphere 3822 15
```

```bash
analyze my_tinker_system.xyz -key get-active.key
> active atoms 1835
```


```bash
$ sed -i -e 's/[ \t]*//' active_tinker.key
$ sed -i 's/^/active /' active_tinker.key
```

```bash
lichem -convert -t my_tinker_system.xyz -k active_tinker.key > conversion-2.log
```

```python
>>> import parmed as pmd
>>> pdb = pmd.load_file(‘my_original_system.pdb’)
>>> pdb.get_box()
array([[81.865, 102.353, 92.1, 90., 90., 90. ]])
```

```bash
lichem -convert -b regions.inp
```


{% include links.html %}
