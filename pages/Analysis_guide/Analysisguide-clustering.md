---
title: Clustering
sidebar: Analysis_sidebar
permalink: Analysisguide-clustering.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

A cluster analysis can be used to group like things.
In terms of trajectories, that means that it can be used to group parts of
simulations that share certain characteristics.
Let's say that in your system, you're really interested in the distance
between two specific helices.
You can use clustering to categorize your entire simulation time into groups
that are based off the distance between them
(i.e., 2-3 &#8491;, 3-4 &#8491;, 4-5 &#8491;, etc).

If you're looking to do a clustering analysis, it's probably because you're
thinking about doing quantum mechanics/molecular mechanics (QM/MM).
Thus, you'll want to pick your clustering criteria based on what you're trying
to study with QM/MM.
Similarly, you'll want to generate 10-20 clusters to be used as snapshots for
the QM/MM optimization.
These clusters should be based on the the *entire* simulation--meaning
every replicate.

This example reads in three full replicate trajectories and then autoimages them.
From there, the distance of interest is found and given a tagged label (`d1`).
Similarly, the root mean square deviation information is found and given the
tagged label `rm0`.
You can choose to write out either of these by specifying the data file to
save them too.
Then, kmeans clustering is done.
The first cluster is given a tag (`C0`), uses kmeans, writes 10 clusters using
data `d1`, and then writes out a bunch of files.
These files contain summary information, which frame most resembles the
average, the option to write a representative structure as a PDB file, and then
information on cluster population over time.
```bash
trajin /absolute/path/to/the/file/WT_protein_system_wat_imaged_1-100.nc
trajin /absolute/path/to/the/file/WT_protein_system_wat_imaged_1-100.nc
trajin /absolute/path/to/the/file/WT_protein_system_wat_imaged_1-100.nc

autoimage

## FE-methyl H
distance d1 :455 :436@H11

## rms info
#rms rm0 :1-455@CA out WT_protein_system_rms_fromclust.dat
rms rm0 :1-455@CA

## k-means based on FE-H11 distance
cluster C0 kmeans clusters 10 data d1 \
  info WT_protein_system_H11_clust_detail_info.dat \
  out WT_protein_system_H11_clustnum_v_time.dat \
  summary WT_protein_system_H11_clust_summary.dat \
  avgout WT_cluster_H11 avgfmt pdb cpopvtime WT_protein_system_H11_popvtime.dat

## k-means based on FE_H11 and rms
cluster C1 kmeans clusters 10 data rm0,d1 \
 info WT_protein_system_H11_rms_clust_detail_info.dat \
 out WT_protein_system_H11_rms_clustnum_v_time.dat \
 summary WT_protein_system_H11_rms_clust_summary.dat \
 avgout WT_cluster_H11_rms avgfmt pdb \
 cpopvtime WT_protein_system_H11_rms_popvtime.dat

## k-means based on rms distances
cluster C2 kmeans clusters 10 data rm0 \
 info WT_protein_system_rms_clust_detail_info.dat \
 out WT_protein_system_rms_clustnum_v_time.dat \
 summary WT_protein_system_rms_clust_summary.dat \
 avgout WT_cluster_rms avgfmt pdb cpopvtime WT_protein_system_rms_popvtime.dat
```

This is by no means the only way to do clustering, and *cpptraj* has more
options than just kmeans.
[This website](https://dashee87.github.io/data%20science/general/Clustering-with-Scikit-with-GIFs/)
has a really great explanation of different clustering methods if you'd like
to read more.

Sometimes the PDB that is written out from clustering (if requested) doesn't
look quite right. That's because the PDB is an average representation.
Thus, it may be ideal to write out the PDB noted in the summary file as
the centroid for the cluster. This can also be done with *cpptraj*.
```bash
autoimage

## Write out the specific PDBs identified with clustering
trajout WT_protein_system_c0_frame_10.pdb pdb onlyframes 10
trajout WT_protein_system_c1_frame_37.pdb pdb onlyframes 37
trajout WT_protein_system_c2_frame_748.pdb pdb onlyframes 748
trajout WT_protein_system_c3_frame_1234.pdb pdb onlyframes 1234
trajout WT_protein_system_c4_frame_5257.pdb pdb onlyframes 5257
trajout WT_protein_system_c5_frame_8924.pdb pdb onlyframes 8924
```

If you need to use the PDB made with *cpptraj* for QM/MM with TINKER, then you
will need to recenter it.
TINKER is written so that the center of mass is located at the origin; AMBER
centers the mass in the periodic box.
So, your *cpptraj* script would look like this:
```bash
autoimage

## TINKER uses origin as COM, by default cpptraj uses box center
## For center command, chose a mask that you'd use for cpptraj analysis
## (probably protein, ligands, metals, and DNA/RNA)
center :1-455 origin mass

## Write out the specific PDBs identified with clustering
trajout WT_protein_system_com_c0_frame_10.pdb pdb onlyframes 10
trajout WT_protein_system_com_c1_frame_37.pdb pdb onlyframes 37
trajout WT_protein_system_com_c2_frame_748.pdb pdb onlyframes 748
trajout WT_protein_system_com_c3_frame_1234.pdb pdb onlyframes 1234
trajout WT_protein_system_com_c4_frame_5257.pdb pdb onlyframes 5257
trajout WT_protein_system_com_c5_frame_8924.pdb pdb onlyframes 8924
```

{% include links.html %}
