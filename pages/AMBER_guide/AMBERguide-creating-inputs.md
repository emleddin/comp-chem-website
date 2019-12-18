---
title: Creating Input Files
sidebar: AMBER_sidebar
permalink: AMBERguide-creating-inputs.html
folder: AMBER_guide
datatable: true
---

<link rel="stylesheet" href="css/theme-orange.css">

Every Amber input file starts with a comment line (that isn't commented out
with a symbol like the `#` sign).
This comment line typically includes a brief overview of what the input file
does (such as which stage of dynamics the system is in). Then, there is a
line with `&cntrl`, which signifies that the following lines will include
information about basic controls. For a line starting `&pb`, the lines that
followed would describe more detailed data manipulation. Any additional
comments you want to insert can be started with an exclamation mark (`!`).

The [table below](AMBERguide-creating-inputs.html#table) has some information
on what specific settings do, and where they can be located in the
[Amber18 manual](http://ambermd.org/doc12/Amber18.pdf).


## Table: Highlighted AMBER18 Settings {#table}
<div class="datatable-begin"></div>

Setting | Explanation | Amber18 Page
------- | ----------- | ------------
imin | Specifies the minization settings. `= 0`: Run MD without minimization [Default] <br> `= 1`:  Energy minimization <br> `= 5`: Read trajectory for analysis | 321
maxcyc | Specifies the maximum number of cycles for minimization. [Default = 1]. | 324
ncyc | Minimization method will switch from steepest descent to conjugate gradient after this many cycles (when default `ntmin = 1`). [Default = 10] | 324
ntc | Specifies whether to perform SHAKE (helps ensure bonds meet proper length constraints, and should be used for MD simulations). When using TIP3P water, use `ntf = ntc = 2`. <br> `= 1`: No SHAKE [Default] <br> `= 2`: Bonds with hydrogen are constrained <br> `= 3`: All bonds are constrained (not an option for QM/MM or parallel runs using *sander*). | 329
iwrap | Specifies wrapping coordinates of restart and trajectory files to within the primary box. <br> `= 0`: No wrapping. The use of *cpptraj* will be necessary to translate back to primary box. [Default] <br> `= 1`: Wrapping is performed. May be necessary for very long runs if files written to ASCII and not NetCDF. | 322
ntb | Specifies whether the system is subjected to periodic boundaries. <br> `= 0`: No periodicity and PME is off. [Default when `igb > 0`] <br> `= 1`: Constant volume. [Default when `ntp = igb = 0`, which are both their respective defaults] <br> `= 2`: Constant pressure. [Default when `ntp > 0`] | 338
ntr | Specifies whether atoms specified through the restraintmask string should be restrained in Cartesian space with a harmonic potential when `ntr = 1`. [Default = 0] | 323
cut | Specifies the nonbonded cutoff (in &#8491;). Any value can be specified. <br> `= 9999.0`: Effectively an infinite cutoff. [Default when `igb > 0`] <br> `= 8.0`: A "good value." [Default when `igb == 0`] | 338
ntx | Specifies what will be read from the inpcrd file. This can be used with either ASCII or NetCDF formatted data. <br> `= 1`: Coordinates will be read [Default] <br> `= 5`: Coordinates and velocities will be read. When `ntb > 0`, box information read. Note: need `irest = 1` to use velocity information. | 321
irest | Allows a simulation to be restarted. <br> `= 0`: Run a new simulation, not a restart. Velocities ignored, and time step set to 0. [Default] <br> `= 1`: Restart simulation, using coordinates and velocities from previously saved restart file. If using this flag, need `ntx > 4` | 321
ntpr | Specifies after how many steps the energy information will be printed to both mdout and mdinfo. [Default = 50] | 322
ntwx | Specifies how frequently coordinates are written to the mdcrd (trajectory) file. If `ntwx = 0`, no trajectory file is written. [Default = 0] | 322
ntwv | Specifies how frequently velocities are written to the mdvel file. <br> `= -1`: velocities written to mdcrd, in a combined coordinate/velocity trajectory file. Must be used with NetCDF binary outpput (`ioutfm = 1`). <br> `= 0`: no velocity trajectory file is written. [Default] | 322
nstlim | Specifies the number of MD steps to run. [Default = 1] | 324
ioutfm | Specifies the format for the coordinate and velocity trajectory files. <br> `= 0`: Formatted ASCII <br> `= 1`: Binary NetCDF [Default] | 323
t | Specifies the time at the start (for personal reference). Automatically taken from an input file if `IREST = 1`. <br> `= 0.0`: [Default] | 324
dt | Specifies the time step in picoseconds. <br> `= 0.001`: Recommended maximum for runs without SHAKE (equivalent to 1 fs). [Default] <br> `= 0.002`: Recommended maximum for runs with SHAKE (equivalent to 2 fs). | 325
ntf | Specifies how forces are evaluated. <br> `= 1`: calculates complete interactions [Default] <br> `= 2`: calculation ignores bond interactions with H-atoms (use with `ntc = 2`) <br> `= 3`: calculation ignores all bond interactions (use with `ntc = 3`) <br> `= 4`: calculation ignores all bonds and angles with H-atoms <br> `= 5`: calculation ignores all bonds and angle interactions <br> `= 6`: calculation ignores dihedrals involving H-atoms and all bonds and angle interactions <br> `= 7`: calculation ignores all bond, angle, and dihedral interactions <br> `= 8`: calculation ignores all bond, angle, dihedral, and non-bonded interactions | 338
ntp | Specifies constant pressure dynamics. <br> `= 0`: no pressure scaling performed. [Default] <br> `= 1`: MD with isotropic position scaling. <br> `= 2`: MD with anisotropic pressure scaling (should only be used with orthogonal boxes, aka "solvateoct"). <br> `= 3`: MD with semiisotropic pressure scaling (should only be used with "solvateoct" and `csurften > 0`). | 327
ig | The random seed. MD starting velocities are dependent on the random number. Setting a specific random seed can be done to check reproducibility. <br> `= -1`: Seed is set based off current date and time. [Default] | 326
barostat | Specifies the barostat for pressure control. <br> `= 1`: Berendsen [Default] <br> `= 2`: Monte Carlo | 328
ntt | Specifies temperature scaling. <br> `= 0`: Constant total energy, assuming `ntb < 2`. Microcanonical NVE. <br> `= 1`: Constant temperature, with weak-coupling algorithm. Dangerous for generalized Born simulations. <br> `= 2`: Anderson-like temperature, with Newtonian dynamics. Canonical (constant T) ensemble. <br> `= 3`: Langevin dynamics with collision frequency specified by `gamma_ln`. (If `gamma_ln = 0`, same as `ntt = 0`). Restarts of these systems should have an explicitly set `ig` value. <br> `= 9`: Optimized Isokinetic Nose-Hoover (OIN) chain ensemble, aka a fancy constant temperature simulation. <br> `= 10`: Stochastic Isokinetic Nose-Hoover RESPA Integrator. Can help demonstrate a Boltzman distribution. | 325
temp0 | The temperature that systems with `ntt > 0` should be held constant at. <br> `= 300`: [Default] <br> If greater than 300, reduce step size, because of potential for errors with SHAKE and other things. | 326
gamma_ln | Specifies the collision frequency, &gamma;, in ps<sup>-1</sup> when using `ntt = 3`. Also specifies constants when `ntt = 9` and `ntt = 10` <br> `= 0`: [Default] | 326
tempi | Specifies the initial temperature, assigning velocites from a Maxwellian distribution. This has no impact if `ntx > 3` <br> `= 0.0`: velocities calculated from the forces, instead of assigned. [Default] | 322
taup | Specifies the pressure relaxation time when `nto > 0`. Recommended to be between 1-5 ps. Unstable trajectories may need a higher value. <br> `= 1.0`: [Default] | 328
tautp | Specifies the time constant (in ps) when `ntt = 1`. Values should range from 0.5-5.0 ps; small values result in faster heating and less natural movement. <br> `= 1.0`: [Default] | 326
vlimit | Velocities greater than specified `vlimit` will be reduced to it, keeping the sign, which helps avoid run instability. [Default = 20] | 327
ibelly | Specifies belly type dynamics. <br> `= 1`: Some atoms in the system are allowed to move, and the rest will be frozen. The moving atoms are specified through `bellymask`. <br> Note: <code>ibelly &#8800; 0</code> is not supported by GPUs. | 323
nsnb | Specifies the frequency of nonbonded list updates when `igb = nbflag = 0`. [Default 25] | 339
nmropt | This specifies whether NMR data will be performed. <br> `= 0`: No NMR analysis will be done [Default] <br> `= 1`: Gives NMR restraints and weight changes <br> `= 5`: Gives NMR restraints, weight changes, NOESY volumes, chemical shifts, and residual dipolar restraints <br> Note: `nmropt > 1` is unsupported for runs on GPUs. | 321
pres0 | The reference pressure (in bar, where 1 bar = 0.987 atm). [Default = 1] | 328
restraint_wt | The weight of positional restraints (in kcal mol<sup>-1</sup>-&#8491;<sup>2</sup>). | 324
restraintmask | The string that explains what atoms should be restrained when `ntr= 1`. | 323

<div class="datatable-end"></div>


## Spacing and Other Formatting {#spacing}

Amber input files also have their own internal spacing requirements.
Comment lines start at the first line position. Both types of lines that start
with the `&` have a space after the start of the line and before the ampersand.
The lines after that, which actually describe the system settings, start with
two spaces after the beginning of the command line. The final line, which ends
that slew of command lines, consists of three spaces between the start of the
command line and the `/` symbol (which means end). Thus, it looks something
like this (where the underscores denote spaces):
```
Comment
_&cntrl
__imin  = 1
___/
```

When restraints are involved, they follow the `/` line, and start yet again
with a comment line (something like "restraints" or "hold protein fixed").
The weight of the restraint is on a line to itself, followed by a line
specifying the residue numbers. After each specific restraint has been
included, the file ends with two lines that simply say `END`.
The following example sets the restraint weight at
10 kcal mol<sup>-1</sup>-&#8491;<sup>2</sup> for residues 1 through 25.
```
System Restraints
10.0
RES 1 25
END
END
```

You can insert comments by beginning them with an exclamation mark (`!`).
```
General comment describing settings of this file
  &cntrl
  imin=1, ! Do minimization
  cut=8.0, ! Use 8 angstrom cutoff
   /
```

## AMBER Math (aka Simulation Length) {#math}

Since `nstlim` refers to the total number of steps, the simulation time of a
single file can be found through an equation of
[`nstlim` / 1000000 fs ns<sup>-1</sup> x `dt` = time of simulation (in ns)].
Thus, with an `nstlim` of 250000 at a 2 fs time-step, 200 files of unrestrained
MD data would yield a total simulation time of 100 nanoseconds.
One [table](AMBERguide-creating-inputs.html#2fs) shows times with a 2 fs
time-step, and another [table](AMBERguide-creating-inputs.html#1fs) shows
times with a 1 fs time-step.
The 2 fs time-step is recommended when using SHAKE (set by `ntc > 1`).
Without SHAKE, the 1 fs time-step is recommended.

<!-- 2 femtosecond timestep -->
## Table: Simulation times with 2.0 fs timestep {#twofs}

| nstlim | Single File Length | Number of Files for 100 ns | Number of Files for 1 &mu;s |
| ------ | ------------------ | -------------------------- | --------------------------- |
125000 | 0.25 ns | 400 | 4000 |
250000 | 0.5 ns | 200 | 2000 |
500000 | 1 ns | 100 | 1000 |
1000000 | 2 ns | 50 | 500 |
2500000 | 5 ns | 20 | 200 |
5000000 | 10 ns | 10 | 100 |
10000000 | 20 ns | 5 & 50 |
12500000 | 25 ns | 4 & 40 |


<!-- %1 femtosecond timestep -->
## Table: Simulation times with 1.0 fs timestep {#onefs}

| nstlim | Single File Length | Number of Files for 100 ns | Number of Files for 1 &mu;s |
| ------ | ------------------ | -------------------------- | --------------------------- |
250000 | 0.25 ns | 400 | 4000 |
500000 | 0.5 ns | 200 | 2000 |
1000000 | 1 ns | 100 | 1000 |
2000000 | 2 ns | 50 | 500 |
5000000 | 5 ns | 20 | 200 |
10000000 | 10 ns | 10 | 100 |
20000000 | 20 ns | 5 | 50 |
25000000 | 25 ns | 4 | 40 |

## GPU Support {#GPUsupport}
Simulations in the NVE, NVT, and NPT ensembles, as well as implicit solvent
Generalized Born simulations, can benefit from GPU acceleration using
*pmemd.cuda*. GPU runs do not give an Ewald error estimate, so it is
recommended to run tests on CPUs to ensure reasonable error estimates.
There are some specific options that are unsupported with *pmemd.cuda*, and
those are listed on page 369 of the Amber17 manual.
For completeness, the specific settings that aren't supported are in the
[GPU table](AMBERguide-creating-inputs.html#GPU).


## Table: Unsupported GPU settings in AMBER {#GPU}

| --------------- | ------------- | -------------------------------- |
| ibelly &#8800; 0 | icfe &#8800; 0 | igb &#8800; 0 && cut < systemsize |
| nmropt > 1      | nrespa &#8800; 1 | vlimit &#8800; -1 |
| MPI runs with imin = 1 | es_cutoff &#8800; vdw_cutoff | order > 4 |
| emil_do_calc &#8800; 0 | lj1264 &#8800; 0 | iemap > 0 |
|                       | isgld > 0       |           |

{% include links.html %}
