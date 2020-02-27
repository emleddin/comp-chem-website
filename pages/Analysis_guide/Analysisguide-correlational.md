---
title: Correlational Analysis
sidebar: Analysis_sidebar
permalink: Analysisguide-correlational.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

Correlational analyses are computed through the example *cpptraj* script
through the following lines:
```
## For correlation matrix
matrix out WT_protein_system_matrix_correl.dat name corr_mat \
 byres :1-476 correl

## For normal modes (evecs = eigenvectors)
matrix out WT_protein_system_covar_mat.dat name norm_mode :1-476 covar
diagmatrix norm_mode out WT_protein_system_evecs.out vecs 100 reduce \
 nmwiz nmwizvecs 100 nmwizfile WT_protein_system_100.nmd nmwizmask :1-476
```

The first `matrix` line calculates the correlation matrix for the system
and outputs that as a data file.

The second `matrix` line builds a covariance matrix for the system.

The `diagmatrix` line will calculate eigenmodes from quasiharmonic analysis
using the generated covariance matrix.
In normal human speak, that means the natural vibration of the system is
computed through the application of fancy physics based on thermodynamics.
One hundred vectors were specified to be calculated.

## Plotting Correlation Matrices with Python {#matrcorrpython}

First things first: This will make the axes wrong if you try to insert them,
which is why they're manually added to images following this script.

This script, like most scripts, should be modified based on the correlations
that you are interested in.
As it is now, it assumes that this script is in a directory that contains
different directories with the data, and that you're looking for a specific
residue of interest (here, it's 436).
Python starts counting at 0, so residue 436 shows up as residue 435 in the
script.
Additionally, the axes need to be set explicitly. This is currently setup for
a system with 455 residues.
Thanks to Alice for `matrcorr_graph.py`.

## matrcorr_graph.py
```python
import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
import statsmodels.api as sm
from tables import *
from matplotlib.colors import LinearSegmentedColormap

data1 = np.genfromtxt("WT-system/WT_protein_system_matrix_correl.dat",delimiter=None)
data2 = np.genfromtxt("MUT-A-system/MUT-A-system_matrix_correl.dat",delimiter=None)
data3 = np.genfromtxt("MUT-B-system/MUT-B-system_matrix_correl.dat",delimiter=None)
data4 = np.genfromtxt("MUT-C-system/MUT-C-system_matrix_correl.dat",delimiter=None)

## Saving Data
data12 = np.subtract(data1,data2)
data21 = np.subtract(data2,data1)
np.savetxt('WT_minus_MUT-A_436.txt',data12[435],fmt='%1.2f')

data13 = np.subtract(data1,data3)
data31 = np.subtract(data3,data1)
np.savetxt('MUT-A_minus_MUT-B_436.txt',data13[435],fmt='%1.2f')

data14 = np.subtract(data1,data4)
data41 = np.subtract(data4,data1)
np.savetxt('WT_minus_MUT-C_436.txt',data14[435],fmt='%1.2f')

data23 = np.subtract(data2,data3)
data32 = np.subtract(data3,data2)
np.savetxt('MUT-A_minus_MUT-B_436.txt',data23[435],fmt='%1.2f')

data24 = np.subtract(data2,data4)
data42 = np.subtract(data4,data2)
np.savetxt('MUT-A_minus_MUT-D_436.txt',data24[435],fmt='%1.2f')

data34 = np.subtract(data3,data4)
data43 = np.subtract(data4,data3)
np.savetxt('MUT-B_minus_MUT-C_436.txt',data34[435],fmt='%1.2f')

## Self Plots

#Explicitly choose where to put x and y ticks
placesx = [0, 100, 200, 300, 400, 455]
placesy = [0, 55, 155, 255, 355, 455]
## Note: we're not using the inverted y-axis
## so therefore, this starts at bottom left

# Define those very x and y tick labels
labelsx = [0, 100, 200, 300, 400, 455]
labelsy = [455, 400, 300, 200, 100, 0]

sm.graphics.plot_corr(data1,normcolor=(-1.0,1.0),cmap='RdYlBu')
ax = plt.gca()
ax.axes.get_xaxis()
ax.set_yticks(placesx)
ax.set_xticklabels(labelsx, fontdict=None, minor=False)
ax.axes.get_yaxis()
ax.set_yticks(placesy)
ax.set_yticklabels(labelsy, fontdict=None, minor=False)
plt.savefig('WT_protein_system_mc.png')
plt.close('WT_protein_system_mc.png')

sm.graphics.plot_corr(data2,normcolor=(-1.0,1.0),cmap='RdYlBu')
ax = plt.gca()
ax.axes.get_xaxis()
ax.set_yticks(placesx)
ax.set_xticklabels(labelsx, fontdict=None, minor=False)
ax.axes.get_yaxis()
ax.set_yticks(placesy)
ax.set_yticklabels(labelsy, fontdict=None, minor=False)
plt.savefig('MUT-A-system_mc.png')
plt.close('MUT-A-system_mc.png')

sm.graphics.plot_corr(data3,normcolor=(-1.0,1.0),cmap='RdYlBu')
ax = plt.gca()
ax.axes.get_xaxis()
ax.set_yticks(placesx)
ax.set_xticklabels(labelsx, fontdict=None, minor=False)
ax.axes.get_yaxis()
ax.set_yticks(placesy)
ax.set_yticklabels(labelsy, fontdict=None, minor=False)
plt.savefig('MUT-B-system_mc.png')
plt.close('MUT-B-system_mc.png')

sm.graphics.plot_corr(data4,normcolor=(-1.0,1.0),cmap='RdYlBu')
ax = plt.gca()
ax.axes.get_xaxis()
ax.set_yticks(placesx)
ax.set_xticklabels(labelsx, fontdict=None, minor=False)
ax.axes.get_yaxis()
ax.set_yticks(placesy)
ax.set_yticklabels(labelsy, fontdict=None, minor=False)
plt.savefig('MUT-C-system_mc.png')
plt.close('MUT-C-system_mc.png')

## Actual Cross Plots

sm.graphics.plot_corr(data12,normcolor=(-1.0,1.0),cmap='RdYlBu')
ax = plt.gca()
ax.axes.get_xaxis()
ax.set_yticks(placesx)
ax.set_xticklabels(labelsx, fontdict=None, minor=False)
ax.axes.get_yaxis()
ax.set_yticks(placesy)
ax.set_yticklabels(labelsy, fontdict=None, minor=False)
plt.savefig('WT_minus_MUT-A_436.png')
plt.close('WT_minus_MUT-A_436.png')

sm.graphics.plot_corr(data21,normcolor=(-1.0,1.0),cmap='RdYlBu')
ax = plt.gca()
ax.axes.get_xaxis()
ax.set_yticks(placesx)
ax.set_xticklabels(labelsx, fontdict=None, minor=False)
ax.axes.get_yaxis()
ax.set_yticks(placesy)
ax.set_yticklabels(labelsy, fontdict=None, minor=False)
plt.savefig('MUT-A_minus_WT_436.png')
plt.close('MUT-A_minus_WT_436.png')

sm.graphics.plot_corr(data13,normcolor=(-1.0,1.0),cmap='RdYlBu')
ax = plt.gca()
ax.axes.get_xaxis()
ax.set_yticks(placesx)
ax.set_xticklabels(labelsx, fontdict=None, minor=False)
ax.axes.get_yaxis()
ax.set_yticks(placesy)
ax.set_yticklabels(labelsy, fontdict=None, minor=False)
plt.savefig('WT_minus_MUT-B_436.png')
plt.close('WT_minus_MUT-B_436.png')

sm.graphics.plot_corr(data31,normcolor=(-1.0,1.0),cmap='RdYlBu')
ax = plt.gca()
ax.axes.get_xaxis()
ax.set_yticks(placesx)
ax.set_xticklabels(labelsx, fontdict=None, minor=False)
ax.axes.get_yaxis()
ax.set_yticks(placesy)
ax.set_yticklabels(labelsy, fontdict=None, minor=False)
plt.savefig('MUT-B_minus_WT_436.png')
plt.close('MUT-B_minus_WT_436.png')

sm.graphics.plot_corr(data24,normcolor=(-1.0,1.0),cmap='RdYlBu')
ax = plt.gca()
ax.axes.get_xaxis()
ax.set_yticks(placesx)
ax.set_xticklabels(labelsx, fontdict=None, minor=False)
ax.axes.get_yaxis()
ax.set_yticks(placesy)
ax.set_yticklabels(labelsy, fontdict=None, minor=False)
plt.savefig('MUT-A_minus_MUT-C_436.png')
plt.close('MUT-A_minus_MUT-C_436.png')

sm.graphics.plot_corr(data42,normcolor=(-1.0,1.0),cmap='RdYlBu')
ax = plt.gca()
ax.axes.get_xaxis()
ax.set_yticks(placesx)
ax.set_xticklabels(labelsx, fontdict=None, minor=False)
ax.axes.get_yaxis()
ax.set_yticks(placesy)
ax.set_yticklabels(labelsy, fontdict=None, minor=False)
plt.savefig('MUT-C_minus_MUT-A_436.png')
plt.close('MUT-C_minus_MUT-A_436.png')

sm.graphics.plot_corr(data34,normcolor=(-1.0,1.0),cmap='RdYlBu')
ax = plt.gca()
ax.axes.get_xaxis()
ax.set_yticks(placesx)
ax.set_xticklabels(labelsx, fontdict=None, minor=False)
ax.axes.get_yaxis()
ax.set_yticks(placesy)
ax.set_yticklabels(labelsy, fontdict=None, minor=False)
plt.savefig('MUT-B_minus_MUT-C_436.png')
plt.close('MUT-B_minus_MUT-C_436.png')

sm.graphics.plot_corr(data43,normcolor=(-1.0,1.0),cmap='RdYlBu')
ax = plt.gca()
ax.axes.get_xaxis()
ax.set_yticks(placesx)
ax.set_xticklabels(labelsx, fontdict=None, minor=False)
ax.axes.get_yaxis()
ax.set_yticks(placesy)
ax.set_yticklabels(labelsy, fontdict=None, minor=False)
plt.savefig('MUT-C_minus_MUT-B_436.png')
plt.close('MUT-C_minus_MUT-B_436.png')
```

## Modifications to Remove Axis Labels
The following modification can be used to have no axis labels.
```python
sm.graphics.plot_corr(data43,normcolor=(-1.0,1.0),cmap='RdYlBu')
ax = plt.gca()
ax.axes.get_xaxis().set_visible(False)
ax.axes.get_yaxis().set_visible(False)
plt.savefig('MUT-C_minus_MUT-B_436.png')
plt.close('MUT-C_minus_MUT-B_436.png')
```

## Modifications for (0,0) Origin
The following modification can be used to have a traditional (0,0) origin by
inverting the y-axis.
```python
#Explicitly choose where to put x and y ticks
placesx = [0, 100, 200, 300, 400, 455]
placesy = [0, 55, 155, 255, 355, 455]
## Note: we're using the inverted y-axis command
## so therefore, this starts at top left

# Define those very x and y tick labels
labelsx = [0, 100, 200, 300, 400, 455]
labelsy = [455, 400, 300, 200, 100, 0]

sm.graphics.plot_corr(data43,normcolor=(-1.0,1.0),cmap='RdYlBu')
ax = plt.gca()
ax.axes.get_xaxis()
ax.set_xticks(placesx)
ax.set_xticklabels(labelsx, fontdict=None, minor=False)
ax.axes.get_yaxis()
ax.set_yticks(placesy)
ax.set_yticklabels(labelsy, fontdict=None, minor=False)
plt.gca().invert_yaxis()
plt.savefig('MUT-C_minus_MUT-B_436.png')
plt.close('MUT-C_minus_MUT-B_436.png')
```

{% include links.html %}
