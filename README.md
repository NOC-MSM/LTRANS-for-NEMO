# LTRANS-for-NEMO
LTRANSv2 modified to work with NEMO.
Vtransform = 5 in the input file LTRANS.data was added to activate it. 
Main changes implied that LTRANS understands the vertical grid of NEMO. 
The following routines were modified:
parameter_module.f90,
LTRANS.f90,
hydrodynamic_module.f90, initGrid().
Also a Lophelia bahaviour was added, Behavior = 8 on LTRANS.data activates it. 
Coded in behaviour_module.f90.
Since most variable names weren't changed within LTRANS it still requiers a NEMO grid with variables renamed as a ROMS grid...
