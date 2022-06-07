# Molecular Dynamics Simulations of Fracture of Graphene: A Tutorial
A molecular dynamics tutorial for new researchers in the area of nanomechanics. An overview of the tutorial has been given below.

 <img src="overview.gif" width="500">

The MATLAB code “input_files.m” generates the required two LAMMPS input files (“grap-in.in” and “grap-data.data”) for the simulation. Atomic coordinates of a pristine graphene sheet (i.e. the file zz_15nm) can be obtained from [Visual Molecular Dynamics (VMD)](https://www.ks.uiuc.edu/Research/vmd/). Alternatively, [this MATLAB code](https://github.com/nuwan-d/graphene_tensile_test/blob/master/input_files.m) can also be used for that purpose.

The MATLAB code “stress_distribution.m” can be used to plot the stress field obtained from the MD simulations.

The MATLAB code “stress_strain_curves.m” can be used to plot the stress-strain data extracted from the MD simulation.
