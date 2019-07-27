---
title: Example Files
sidebar: AMBER_sidebar
permalink: AMBERguide-example-files.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

## NVT with Berendsen Thermostat {#NVT}
Yet again, thanks to Alice for these inputs (who in turn thanks Sajeewa).
Using the Berendsen thermostat makes this halfway NVE and halfway NVT, but it
should be reported as NVT. That said, you really shouldn't use the Berendsen
thermostat because of the possibility of experiencing the
"Flying Ice Cube Effect." You can read more about that [in the original 1998 paper][https://doi.org/10.1002/(SICI)1096-987X(199805)19:7<726::AID-JCC4>3.0.CO;2-S] and [a 2018 paper revisiting the concept][https://pubs.acs.org/doi/10.1021/acs.jctc.8b00446].
If you need any more convincing, see the tweet below.

{% include image.html file="AMBERguide/Berendsen_tweet.png"
alt="Tweet from John Chodera that says 'Friends don't let friends use Berendsen
for thermal or pressure control. The quoted tweet (from Robert T. McGibbon)
says 'The abstract claims that the use of Berendsen thermostats continues to
grow. Is that really true?'
"
caption="A compelling argument about not using Berendsen.
Don't do it (for the meme)." %}


Minimization lasts from inputs 1-5. Heating occurs at input 6.
Equilibration lasts from inputs 7-10. Production is performed with input 11.

### `mdin.1` {#mdin1NVT}
Energy minimization for 5000 cycles, switching from steepest descent
to conjugate gradient after 500 cycles. Bonds with hydrogen are constrained and
ignored with SHAKE. Wrapping is performed for files, the system is held at
constant volume, atoms with the specified restraint mask are restrained at
those weights (in kcal mol<s>-1</s>, and the nonbonded cutoff is 9 &#8491;.
```
Protein
 &cntrl
  imin   = 1,
  maxcyc = 5000,
  ncyc   = 500,
  ntc = 2, ntf = 2,
  iwrap = 1,
  ntb    = 1,
  ntr    = 1,
  cut    = 9
   /
Hold protein fixed
200.0
RES 1 430
200.0
RES 431 450
200.0
RES 451 455
END
END
```

### `mdin.2` {#mdin2NVT}
Coordinates will be read and a new simulation will be run.
The velocities are ignored and the time step is set to zero.
After 5 steps, energy information will be printed to the mdout and mdinfo files.
After 100 steps, coordinates will be written to the trajectory file, and no
velocity trajectory file is written. 10,000 MD steps will be run from a start
time of 0, and the time step is every 1 fs.
Bonds with hydrogen are constrained and ignored with SHAKE.
The simulation is at constant pressure with isotropic position scaling.
Wrapping is performed for files, and the random seed is set based off the
current date and time. The simulation is run at constant temperature, with weak
coupling. The initial temperature is 10 K, and the externally coupled
temperature is held constant at 10 K at a speed of 0.5 ps.
Atoms with the specified restraint mask are restrained at those weights
(in kcal mol<s>-1</s>), and the nonbonded cutoff is 9 &#8491;.
```
Protein
 &cntrl
  ntx=1,        irest=0,
  ntpr=5,       ntwx=100,     ntwv=00,
  nstlim=10000,   t=0.00,        dt=0.00100,
  ntc = 2, ntf = 2,
  ntb    = 2, ntp=1,
  iwrap = 1,
  ig=-1
  ntt=1, temp0=010.0, tempi=010.0, tautp=0.5,
  ntr    = 1,
  cut    = 09.0,
 /
Hold protein fixed
200.0
RES 1 430
200.0
RES 431 450
200.0
RES 451 455
END
END
```


### `mdin.3` {#mdin3NVT}
Coordinates and box information are read from a NetCDF or ASCII
coordinate file. The simulation is restarted, based on coordinates and
velocities from the previously saved restart file. The restraint weight is
halved. Everything else is the same as
[mdin.2](AMBERguide-example-files.html#mdin2NVT) [See the note below.]
```
Protein
 &cntrl
  ntx=7,        irest=1,
  ntpr=5,       ntwx=100,     ntwv=00,
  nstlim=100000,   t=0.00,        dt=0.00100,
  ntc = 2, ntf = 2,
  ntb    = 2, ntp=1,
  iwrap = 1,
  ig=-1
  ntt=1, temp0=010.0, tempi=010.0, tautp=0.5,
  ntr    = 1,
  cut    = 09.0,
 /
Hold protein fixed
100.0
RES 1 430
100.0
RES 431 450
100.0
RES 451 455
END
END
```

{% include note.html content="`ntx = 7` is an
[old (OLD) form][archive.ambermd.org/200704/0111.html], and is equivalent to
`ntx = 5`. Thus, `ntx = 5` should be used. This is corrected in the remaining
input files shown here." %}


### `mdin.4` {#mdin4NVT}
The frequency of the nonbonded list updates every step, and there are no belly
type dynamics. The restraint weight is halved. Everything else is the same as
[mdin.3](AMBERguide-example-files.html#mdin3NVT).
```
Protein
 &cntrl
  ntx=5,        irest=1,
  nsnb=1,
  ntpr=5,       ntwx=100,     ntwv=00,
  nstlim=100000,   t=0.00,        dt=0.00100,
  ntc = 2, ntf = 2,
  ntb    = 2, ntp=1,
  iwrap = 1,
  ntt=1, temp0=010.0, tempi=010.0, tautp=0.5,
  ntr    = 1,
  cut    = 09.0,
  ibelly=0,
 /
Hold protein fixed
50.0
RES 1 430
50.0
RES 431 450
50.0
RES 451 455
END
END
```


### `mdin.5` {#mdin5NVT}
The restraint weight is halved from
[mdin.4](AMBERguide-example-files.html#mdin4NVT).
```
Protein
 &cntrl
  ntx=5,        irest=1,
  nsnb=1,
  ntpr=5,       ntwx=100,     ntwv=00,
  nstlim=10000,   t=0.00,        dt=0.00100,
  ntc = 2, ntf = 2,
  ntb    = 2, ntp=1,
  iwrap = 1,
  ntt=1, temp0=010.0, tempi=010.0, tautp=0.5,
  ntr    = 1,
  cut    = 09.0,
  ibelly=0,
 /
Hold protein fixed
25.0
RES 1 430
25.0
RES 431 450
25.0
RES 451 455
END
END
```

### `mdin.6` {#mdin6NVT}
Coordinates will be read and a new simulation will be run. The velocities are
ignored and the time step is set to zero. The frequency of the nonbonded list
updates every step. After 100 steps, energy information will be printed to the
mdout and mdinfo files. After 1000 steps, coordinates will be written to the
trajectory file, and no velocity trajectory file is written. 100000 MD steps
will be run from a start time of 0, and the time step is every 1 fs.
Bonds with hydrogen are constrained and ignored with SHAKE.
The simulation is at constant volume. Wrapping is performed for files.
The simulation is run at constant temperature, with weak coupling.
The initial temperature is 10.0 K, and the externally coupled temperature is
held constant at 10.0 K at a speed of 0.001 ps.
Velocities greater than 20.0 will be reduced to the magnitude 20.0.
Atoms with the specified restraint mask are restrained at those weights
(in kcal mol<s>-1</s>), NMR restraints and weight changes will be given,
and the nonbonded cutoff is 9 &#8491;.
The target temperature (`TEMP0`) will be adjusted at the specified time
intervals.
```
Protein Constant volume constraints on protein + active site
 &cntrl
  ntx=5,        irest=1,
  nsnb=1,
  ntpr=100,       ntwx=1000,     ntwv=00,
  nstlim=100000,   t=0.00,        dt=0.00100,
  ntc = 2, ntf = 2,
  ntb    = 1,
  iwrap = 1,
  ntt=1, temp0=010.0, tempi=010.0, tautp=0.001, vlimit=20.0,
  ntr    = 1,
  cut    = 09.0,
  nmropt=1
 /
 &wt type='TEMP0', istep1=00000, istep2=05000, value1=000., value2=010.,  &end
 &wt type='TEMP0', istep1=05001, istep2=10000, value1=010., value2=020.,  &end
 &wt type='TEMP0', istep1=10001, istep2=20000, value1=020., value2=050.,  &end
 &wt type='TEMP0', istep1=20001, istep2=30000, value1=050., value2=100.,  &end
 &wt type='TEMP0', istep1=30001, istep2=40000, value1=100., value2=150.,  &end
 &wt type='TEMP0', istep1=40001, istep2=50000, value1=150., value2=200.,  &end
 &wt type='TEMP0', istep1=50001, istep2=60000, value1=200., value2=250.,  &end
 &wt type='TEMP0', istep1=60001, istep2=70000, value1=250., value2=300.,  &end
 &wt type='TEMP0', istep1=70001, istep2=80000, value1=300., value2=325.,  &end
 &wt type='TEMP0', istep1=80001,istep2=100000, value1=325., value2=300.,  &end
 &wt type='END'  &end
Hold protein fixed
500.0
RES 1 430
500.0
RES 431 450
500.0
RES 451 455
END
END
```

### `mdin.7` {#mdin7NVT}
After 10,000 steps, energy information will be printed to the mdout and mdinfo
files. After 1000 steps, coordinates will be written to the trajectory file,
and no velocity trajectory file is written.
20000 MD steps will be run from a start time of 0, and the time step is every
1 fs.
Bonds with hydrogen are constrained and ignored with SHAKE.
The initial temperature is 300.0 K, and the externally coupled temperature is
held constant at 300.0 K at a speed of 1.0 ps. No NMR analysis will be done,
and the initial temperature will not be varied. Otherwise, this is the same as
[mdin.6](AMBERguide-example-files.html#mdin6NVT).
```
Protein Constant volume constraints on protein + active site
 &cntrl
  ntx=5, irest=1,
  nsnb=1,
  ntpr=10000, ntwx=1000, ntwv=0,
  nstlim=20000, t=0.00, dt=0.00100,
  ntc = 2, ntf = 2,
  iwrap = 1,
  ntb    = 1,
  ntt=1, temp0=300.0, tempi=300.0, tautp=1.0, vlimit=20.0,
  ntr    = 1,
  cut    = 9.0,
 /
Hold protein fixed
500.0
RES 1 430
500.0
RES 431 450
500.0
RES 451 455
END
END
```


### `mdin.8` {#mdin8NVT}
After 100 steps, energy information will be printed to the mdout and mdinfo
files.
After 1000 steps, coordinates will be written to the trajectory file, and no
velocity trajectory file is written.
10000 MD steps will be run from a start time of 0, and the time step is every
1 fs. The restraint weight is reduced.
The rest is the same as [mdin.7](AMBERguide-example-files.html#mdin7NVT).
```
Protein Constant volume constraints on protein + active site
 &cntrl
  ntx=5,        irest=1,
  nsnb=1,
  ntpr=100,       ntwx=1000,     ntwv=00,
  nstlim=10000,   t=0.00,        dt=0.00100,
  ntc = 2, ntf = 2,
  ntb    = 1,
  iwrap = 1,
  ntt=1, temp0=300.0, tempi=300.0, tautp=1.0, vlimit=20.0,
  ntr    = 1,
  cut    = 09.0
 /
Hold protein fixed
200.0
RES 1 430
200.0
RES 431 450
200.0
RES 451 455
END
END
```


### `mdin.9` {#mdin9NVT}
The restraint weight is reduced from
[mdin.8](AMBERguide-example-files.html#mdin8NVT).
```
Protein Constant volume constraints on protein + active site
 &cntrl
  ntx=5,        irest=1,
  nsnb=1,
  ntpr=100,       ntwx=1000,     ntwv=00,
  nstlim=10000,   t=0.00,        dt=0.00100,
  ntc = 2, ntf = 2,
  ntb    = 1,
  iwrap = 1,
  ntt=1, temp0=300.0, tempi=300.0, tautp=1.0, vlimit=20.0,
  ntr    = 1,
  cut    = 09.0
 /
Hold protein fixed
0.0
RES 1 430
25.0
RES 431 450
0.0
RES 451 455
END
END
```


### `mdin.10` {#mdin10NVT}
The restraint weight is reduced from
[mdin.9](AMBERguide-example-files.html#mdin9NVT).
```
Protein Constant volume constraints on protein + active site
 &cntrl
  ntx=5,        irest=1,
  nsnb=1,
  ntpr=100,       ntwx=1000,     ntwv=00,
  nstlim=10000,   t=0.00,        dt=0.00100,
  ntc = 2, ntf = 2,
  ntb    = 1,
  iwrap = 1,
  ntt=1, temp0=300.0, tempi=300.0, tautp=1.0, vlimit=20.0,
  ntr    = 1,
  cut    = 09.0
 /
Hold protein fixed
0.0
RES 1 430
10.0
RES 431 450
0.0
RES 451 455
END
END
```


### `mdin.11` {#mdin11NVT}
Coordinates will be read and a new simulation will be run.
The velocities are ignored and the time step is set to zero.
The frequency of the nonbonded list updates every step.
After 100 steps, energy information will be printed to the mdout and mdinfo
files. After 1000 steps, coordinates will be written to the trajectory file,
and no velocity trajectory file is written.
250000 MD steps will be run from a start time of 0, and the time step is every
2 fs.
Bonds with hydrogen are constrained and ignored with SHAKE.
The simulation is at constant volume.
No wapping is performed, requiring *cpptraj* to translate back to the original
box. The simulation is run at constant temperature, with weak coupling.
The initial temperature is 300.0 K, and the externally coupled temperature is
held constant at 300.0 K at a speed of 1 ps.
Velocities greater than 20.0 will be reduced to the magnitude 20.0;
this is later changed to -1.0.
NMR restraints and weight changes will be given, and the nonbonded cutoff is
9 &#8491;.
The relative weights of all the NMR restraint energy terms (`REST`) will be
adjusted at step 5000.
```
Protein Constant volume no contraints
 &cntrl
  ntx=5,        irest=1,
  nsnb=1,
  ntpr=100,       ntwx=1000,     ntwv=00,
  nstlim=250000,   t=0.00,        dt=0.00200,
  ntc = 2, ntf = 2,
  ntb    = 1,
  ntt=1, temp0=300.0, tempi=300.0, tautp=1.0, vlimit=20.0,
  iwrap = 0
  cut    = 09.0,
  nmropt=1
  vlimit=-1
 /
 &wt type='REST', istep1=000000,istep2=5000, &end
 &wt type='END'  &end /
```


## NVT Through Heating and NPT Production Langevin Dynamics {#NVT-NPT}
Thanks to Hedi for these inputs.

### `mdin.1` (aka `min1.in`) {#mdin1lang}
Energy minimization for 1000 cycles, switching from steepest descent to
conjugate gradient after 50 cycles.
No SHAKE, and complete interactions are calculated.
Wrapping is performed for files, the system is held at constant volume,
atoms with the specified restraint mask are restrained at those weights
(in kcal mol<s>-1</s>), and the nonbonded cutoff is 9 &#8491;.
```
minimization of water and ions
 &cntrl
  imin   = 1,
  maxcyc = 1000,
  ncyc   = 50,
  ntc = 1, ntf = 1,
  iwrap = 1,
  ntb    = 1,
  ntr    = 1,
  cut    = 9.0
 /
Hold the Enzyme Fixed
500.0
RES 1 455
END
END
```


### `mdin.2` (aka `min2.in`) {#mdin2lang}
Energy minimization for 2500 cycles, switching from steepest descent to
conjugate gradient after 50 cycles.
Bonds with hydrogen are constrained and ignored with SHAKE.
Wrapping is performed for files, the system is held at constant volume, no
restraints are held on atoms, and the nonbonded cutoff is 9 &#8491;.
```
minimization of enzyme
 &cntrl
  imin   = 1,
  maxcyc = 2500,
  ncyc   = 50,
  ntc = 2, ntf = 2,
  iwrap = 1,
  ntb    = 1,
  ntr    = 0,
  cut    = 9.0
 /
```


### `mdin.3` (aka `heat.in`) {#mdin3lang}
Coordinates will be read, and a new simulation will be run at constant volume.
Atoms with the specified restraint mask are restrained at those weights
(in kcal mol<s>-1</s>), and the nonbonded cutoff is 9 &#8491;.
Bonds with hydrogen are constrained and ignored with SHAKE.
The initial temperature is 0.0 K, and the externally coupled temperature is
held constant at 300.0 K using Langevin dynamics with collisional frequency of
1 ps. The random seed is set based on date and time.
100000 MD steps will be run with a time step of 1 fs.
After 100 steps, energy information will be printed to the mdout and mdinfo
files. After 10,000 steps, coordinates will be written to the trajectory file,
and the restart file will be written to every 100 steps.
Atoms with the specified restraint mask are restrained at those weights
(in kcal mol<s>-1</s>).
```
heat up
 &cntrl
  imin   = 0,
  irest  = 0,
  ntx    = 1,
  ntb    = 1,
  cut    = 9.0,
  ntr    = 1,
  ntc    = 2,
  ntf    = 2,
  tempi  = 0.0,
  temp0  = 300.0,
  ntt    = 3,
  gamma_ln = 1.0, ig = -1,
  nstlim = 100000, dt = 0.001
  ntpr = 100, ntwx = 10000, ntwr = 100
 /
Keep Enzyme fixed with weak restraints
10.0
RES 1 455
END
END
```


### `mdin.4` (aka `prod.in`) {#mdin4lang}
The simulation will be restarted from the previously saved restart file.
Coordinates and velocities will be read.
The system will be held at constant pressure using isotropic position scaling,
with a reference pressure of 1.0 bar, and a pressure relaxation time of 2.0 ps.
The nonbonded cutoff is 9 &#8491;, and no atoms will be restrained.
Bonds with hydrogen are constrained and ignored with SHAKE.
The initial temperature is 300.0 K, and the externally coupled temperature is
held constant at 300.0 K using Langevin dynamics with collisional frequency of
1 ps<s>-1</s>.
The random seed is set based on date and time.
1,000,000 MD steps will be run with a time step of 1 fs.
After 100 steps, energy information will be printed to the mdout and mdinfo
files. After 10,000 steps, coordinates will be written to the trajectory file,
and the restart file will be written to every 100 steps.
```
production
 &cntrl
  imin = 0, irest = 1, ntx = 7,
  ntb = 2, pres0 = 1.0, ntp = 1,
  taup = 2.0,
  cut = 9.0, ntr = 0,
  ntc = 2, ntf = 2,
  tempi = 300.0, temp0 = 300.0,
  ntt = 3, gamma_ln = 1.0, ig = -1,
  nstlim = 1000000, dt = 0.001,
  ntpr = 100, ntwx = 10000, ntwr = 100
 /
```

## NPT Langevin Dynamics {#NPT}
These inputs were provided by Dr. Bill Miller III.

### `mdin.1` (aka `min1.mdin`) {#mdin1tsu}
Energy minimization for 5000 cycles, switching from steepest descent to
conjugate gradient after 1000 cycles.
Information is printed to mdout and mdinfo every 50 steps.
The nonbonded cutoff is 8 &#8491;, wrapping is performed for files, and atoms
with the specified restraint mask (i.e. all non-hydrogen atoms) are restrained
at 10.0 kcal mol<s>-1</s>.
```
Minimization to relax initial bad contacts, explicit solvent
 &cntrl
  imin=1,
  ncyc=1000,
  maxcyc=5000,
  ntpr=50,
  cut=8,
  iwrap=1,
  ntr=1,
  restraint_wt=10.0,
  restraintmask='!@H=',
 /
```


### `mdin.2` (aka `min2.mdin`) {#mdin2tsu}
The is the same as
[mdin.1](AMBERguide-example-files.html#mdin1tsu), except the restraints are
reduced to 5.0 kcal mol<s>-1</s>.
```
Minimization to relax initial bad contacts, explicit solvent
 &cntrl
  imin=1,
  ncyc=1000,
  maxcyc=5000,
  ntpr=50,
  cut=8,
  iwrap=1,
  ntr=1,
  restraint_wt=5.0,
  restraintmask='!@H=',
 /
```


### `mdin.3` (aka `min3.mdin`) {#mdin3tsu}
The is the same as [mdin.2](AMBERguide-example-files.html#mdin2tsu), except
the restraints are reduced to 2.0 kcal mol<s>-1</s>.
```
Minimization to relax initial bad contacts, explicit solvent
 &cntrl
  imin=1,
  ncyc=1000,
  maxcyc=5000,
  ntpr=50,
  cut=8,
  iwrap=1,
  ntr=1,
  restraint_wt=2.0,
  restraintmask='!@H=',
 /
```

### `mdin.4` (aka `min4.mdin`) {#mdin4tsu}
This is the same as [mdin.3](AMBERguide-example-files.html#mdin3tsu),
except the restraints are reduced to 1.0 kcal mol<s>-1</s>.
```
Minimization to relax initial bad contacts, explicit solvent
 &cntrl
  imin=1,
  ncyc=1000,
  maxcyc=5000,
  ntpr=50,
  cut=8,
  iwrap=1,
  ntr=1,
  restraint_wt=1.0,
  restraintmask='!@H=',
 /
```

### `mdin.5` (aka `min5.mdin`) {#mdin5tsu}
This is the same as [mdin.4](AMBERguide-example-files.html#mdin4tsu), except
the restraints are reduced to 0.5 kcal mol<s>-1</s>.
```
Minimization to relax initial bad contacts, explicit solvent
 &cntrl
  imin=1,
  ncyc=1000,
  maxcyc=5000,
  ntpr=50,
  cut=8,
  iwrap=1,
  ntr=1,
  restraint_wt=0.5,
  restraintmask='!@H=',
 /
```


### `mdin.6` (aka `min6.mdin`) {#mdin6tsu}
This is the same as [mdin.5](AMBERguide-example-files.html#mdin5tsu),
except the restraints are reduced to 0.1 kcal mol<s>-1</s>.
```
Minimization to relax initial bad contacts, explicit solvent
 &cntrl
  imin=1,
  ncyc=1000,
  maxcyc=5000,
  ntpr=50,
  cut=8,
  iwrap=1,
  ntr=1,
  restraint_wt=0.1,
  restraintmask='!@H=',
 /
```

### `mdin.7` (aka `min7.mdin`) {#mdin7tsu}
The is the same as [mdin.6](AMBERguide-example-files.html#mdin6tsu),
except the restraints have been completely removed.
```
Minimization to relax initial bad contacts, explicit solvent
 &cntrl
  imin=1,
  ncyc=1000,
  maxcyc=5000,
  ntpr=50,
  cut=8,
  iwrap=1,
 /
```


### `mdin.8` (aka `heat.mdin`) {#mdin8tsu}
Coordinates will be read, and a new simulation will be run.
1,000,000 MD steps will be run with a time step of 2 fs. After 50,000 steps,
energy information will be printed to the mdout and mdinfo files.
After 50,000 steps, coordinates will be written to the trajectory file,
and the restart file will be written to every 50,000 steps.
Langevin temperature scaling with collisional frequency of 5.0 ps<s>-1</s> is
used, and the starting velocities are picked from a random seed based on the
date and time.
For SHAKE, bonds with hydrogen are constrained and  hydrogen atoms are ignored.
The nonbonded cutoff is 8 &#8491;.
The system is subjected to the constant pressure periodic boundary, and
constant pressure MD is used with isotropic position scaling.
Wrapping is performed for files, the outputs are written as binary NetCDF
files, and NMR restraints and weight changes are given.
Atoms with the specified restraint mask are restrained at the weight of
10 kcal mol<s>-1</s>.
The NMR-style restraints describe the temperature increases.
The temperature at time step 0 is 10.0 K, and linearly increases until reaching
100.0 K at time step 100,000.
From there, the temperature linearly increases until reaching 300.0 K at time
step 500,000.
```
Explicit solvent initial heating mdin
 &cntrl
  imin=0, irest=0, ntx=1,
  ntpr=50000, ntwx=50000, ntwr=50000, nstlim=1000000,
  dt=0.002, ntt=3, gamma_ln=5.0, ig=-1,
  ntc=2, ntf=2, cut=8, ntb=2, ntp=1,
  iwrap=1, ioutfm=1, nmropt=1,
  ntr=1, restraint_wt=10, restraintmask=':1-603'
 /
 &wt
  TYPE='TEMP0', ISTEP1=0, ISTEP2=100000,
  VALUE1=10.0, VALUE2=100.0,
 /
 &wt
  TYPE='TEMP0', ISTEP1=100001, ISTEP2=500000,
  VALUE1=100.0, VALUE2=300.0,
 /
 &wt TYPE='END' /
```


### `mdin.9` (aka `eq1.mdin`) {#mdin9tsu}
Coordinates will be read, and a new simulation will be run.
250,000 MD steps will be run with a time step of 2 fs.
After 10,000 steps, energy information will be printed to the mdout and mdinfo
files.
After 10,000 steps, coordinates will be written to the trajectory file,
and the restart file will be written to every 10,000 steps.
Langevin temperature scaling with collisional frequency of 1.0 ps<s>-1</s>
is used, and the starting velocities are picked from a random seed based on the
date and time.
For SHAKE, bonds with hydrogen are constrained and  hydrogen atoms are ignored.
The nonbonded cutoff is 9 &#8491;.
The system is subjected to the constant pressure periodic boundary,
and constant pressure MD is used with isotropic position scaling.
Wrapping is performed for files, and the outputs are written as binary NetCDF
files.
Atoms with the specified restraint mask are restrained at the weight of
10 kcal mol<s>-1</s>.
```
Explicit solvent molecular dynamics constant pressure MD
 &cntrl
  imin=0, irest=0, ntx=1,
  ntpr=10000, ntwx=10000, ntwr=10000, nstlim=250000,
  dt=0.002, ntt=3, tempi=300,
  temp0=300, gamma_ln=1.0, ig=-1,
  ntp=1, ntc=2, ntf=2, cut=9,
  ntb=2, iwrap=1, ioutfm=1,
  ntr=1, restraint_wt=10, restraintmask=':1-603'
 /
```


### `mdin.10` (aka `eq2.mdin`) {#mdin10tsu}
The is the same as [mdin.9](AMBERguide-example-files.html#mdin9tsu),
except the restraints are reduced to 5.0 kcal mol<s>-1</s>.
```
Explicit solvent molecular dynamics constant pressure MD
 &cntrl
  imin=0, irest=0, ntx=1,
  ntpr=10000, ntwx=10000, ntwr=10000, nstlim=250000,
  dt=0.002, ntt=3, tempi=300,
  temp0=300, gamma_ln=1.0, ig=-1,
  ntp=1, ntc=2, ntf=2, cut=9,
  ntb=2, iwrap=1, ioutfm=1,
  ntr=1, restraint_wt=5.0, restraintmask=':1-603'
 /
```


### `mdin.11` (aka `eq3.mdin`) {#mdin11tsu}
The is the same as [mdin.10](AMBERguide-example-files.html#mdin10tsu),
except the restraints are reduced to 2.0 kcal mol<s>-1</s>.
```
Explicit solvent molecular dynamics constant pressure MD
 &cntrl
  imin=0, irest=0, ntx=1,
  ntpr=10000, ntwx=10000, ntwr=10000, nstlim=250000,
  dt=0.002, ntt=3, tempi=300,
  temp0=300, gamma_ln=1.0, ig=-1,
  ntp=1, ntc=2, ntf=2, cut=9,
  ntb=2, iwrap=1, ioutfm=1,
  ntr=1, restraint_wt=2.0, restraintmask=':1-603'
 /
```


### `mdin.12` (aka `eq4.mdin`) {#mdin12tsu}
The is the same as [mdin.11](AMBERguide-example-files.html#mdin11tsu),
except the restraints are reduced to 1.0 kcal mol<s>-1</s>.
```
Explicit solvent molecular dynamics constant pressure MD
 &cntrl
  imin=0, irest=0, ntx=1,
  ntpr=10000, ntwx=10000, ntwr=10000, nstlim=250000,
  dt=0.002, ntt=3, tempi=300,
  temp0=300, gamma_ln=1.0, ig=-1,
  ntp=1, ntc=2, ntf=2, cut=9,
  ntb=2, iwrap=1, ioutfm=1,
  ntr=1, restraint_wt=1.0, restraintmask=':1-603'
 /
```


### `mdin.13` (aka `eq5.mdin`) {#mdin13tsu}
The is the same as [mdin.12](AMBERguide-example-files.html#mdin12tsu),
except the restraints are reduced to 0.5 kcal mol<s>-1</s>.
```
Explicit solvent molecular dynamics constant pressure MD
 &cntrl
  imin=0, irest=0, ntx=1,
  ntpr=10000, ntwx=10000, ntwr=10000, nstlim=250000,
  dt=0.002, ntt=3, tempi=300,
  temp0=300, gamma_ln=1.0, ig=-1,
  ntp=1, ntc=2, ntf=2, cut=9,
  ntb=2, iwrap=1, ioutfm=1,
  ntr=1, restraint_wt=0.5, restraintmask=':1-603'
 /
```


### `mdin.14` (aka `eq6.mdin`) {#mdin14tsu}
The is the same as [mdin.13](AMBERguide-example-files.html#mdin13tsu),
except the restraints are reduced to 0.1 kcal mol<s>-1</s>.
```
Explicit solvent molecular dynamics constant pressure MD
 &cntrl
  imin=0, irest=0, ntx=1,
  ntpr=10000, ntwx=10000, ntwr=10000, nstlim=250000,
  dt=0.002, ntt=3, tempi=300,
  temp0=300, gamma_ln=1.0, ig=-1,
  ntp=1, ntc=2, ntf=2, cut=9,
  ntb=2, iwrap=1, ioutfm=1,
  ntr=1, restraint_wt=0.1, restraintmask=':1-603'
 /
```


### `mdin.15` (aka `eq7.mdin`) {#mdin15tsu}
The restraints are removed from
[mdin.14](AMBERguide-example-files.html#mdin14tsu)
for the "final" stage of equilibration.
```
Explicit solvent molecular dynamics constant pressure MD
 &cntrl
  imin=0, irest=0, ntx=1,
  ntpr=10000, ntwx=10000, ntwr=10000, nstlim=250000,
  dt=0.002, ntt=3, tempi=300,
  temp0=300, gamma_ln=1.0, ig=-1,
  ntp=1, ntc=2, ntf=2, cut=9,
  ntb=2, iwrap=1, ioutfm=1,
 /
```


### `mdin.16` (aka `md.mdin`) {#mdin16tsu}
Coordinates and velocities will be read, and a the simulation will be restarted
using the coordinates and velocities from the restart file.
12,500,000 MD steps will be run with a time step of 2 fs.
After 10,000 steps, energy information will be printed to the mdout and mdinfo
files.
After 10,000 steps, coordinates will be written to the trajectory file,
and the restart file will be written to every 10,000 steps.
Langevin temperature scaling with collisional frequency of 1.0 ps<s>-1</s>
is used, and the starting velocities are picked from a random seed based on the
date and time.
For SHAKE, bonds with hydrogen are constrained and  hydrogen atoms are ignored.
The nonbonded cutoff is 9 &#8491;.
The system is subjected to the constant pressure periodic boundary,
and constant pressure MD is used with isotropic position scaling.
Wrapping is performed for files, and the outputs are written as binary NetCDF
files.
Atoms with the specified restraint mask are restrained at the weight of
10 kcal mol<s>-1</s>.
```
Explicit solvent molecular dynamics constant pressure 25 ns MD
 &cntrl
  imin=0, irest=1, ntx=5,
  ntpr=50000, ntwx=50000, ntwr=50000, nstlim=12500000,
  dt=0.002, ntt=3, tempi=300,
  temp0=300, gamma_ln=1.0, ig=-1,
  ntp=1, ntc=2, ntf=2, cut=9,
  ntb=2, iwrap=1, ioutfm=1,
 /
```

{% include note.html content="You can use a a negative value for `ntwr`,
and this will give each restart file will have a unique name and make it so
they won't be overwritten. 
Each restart file would be named like `WT_protein_md001.rst7_50000`." %}

{% include links.html %}
