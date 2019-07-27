---
title: System Types
sidebar: AMBER_sidebar
permalink: AMBERguide-systemtypes.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

* __NVE__: The microcanonical ensemble, where the system is kept from changes
in moles (N), volume (V), and energy (E). This set-up is an example of an
adiabatic process.

* __NVT__: The canonical ensemble, where the system is kept from changes in
moles (N), volume (V), and temperature (T). This set-up is also known as
constant-temperature molecular dynamics, and requires a thermostat.

* __NPT__: The isothermal-isobaric ensemble, where the system is kept from
changes in moles (N), pressure (P), and temperature (T). Both a thermostat and
barostat are needed.

* __NPH__: The system is kept from changes in moles (N), pressure (P), and 
enthalpy (H). Enthalpy is held constant when the pressure is fixed without
temperature control.

* __NST__: The system is kept under constant-temperature and constant-stress
conditions. It is closely related to the NPT ensemble. Hydrostatic pressure is
applied uniformly (isotropically), and the components of the stress tensor are
controlled. It is good for studying the stress-strain relationship of polymers
or metals.


## Regulators {#regulators}

* __Langevin Dynamics (NVT or NPT)__: attempts to mimic solvent viscosity by
introducing things that occasionally cause friction and perturb the system.
When used to control temperature, a small damping constant, *&gamma;*, should
be used.
* __Berendsen Thermostat__: the system is weakly coupled to a heat bath at a
set temperature. The thermostat doesn't mirror the canonical ensemble for small
systems, but large systems are roughly ok. It uses a leap-frog algorithm to
rescale velocities of particles, controlling temperature.

* __Andersen Thermostat__: reassigns a chosen atom or molecule's velocity given
by the Maxwell-Boltzmann statistics for the given temperature.


## Solvent Models {#solv-mods}

* __Implicit Solvent__: The solvent is implied and math occurs to make it seem
like there's a solvent. Essentially, the system is held under a polarizable
medium defined by the dielectric constant. Think of this like a magician waving
a wand--there's obviously some magic happening, but you can't actually see it.

* __Explicit Solvent__: The solvent is explicitly set in the system and given
physical coordinates. Instead of being an audience member seeing the magic
show, you're the magician's apprentice, and you're seeing all the little things
that go into tricking the audience (like how there's 2 people in the box being
"sawed in half"). TIP3P water is an example of an explicit solvent model.

* __Hybrid Models__: These are somewhere between implicit and explicit, and
typically found in QM/MM simulations.

* __Gas Phase__: This isn't actually a solvent model, but the lack of a solvent
model. All calculations are done in a vacuum.

{% include links.html %}
