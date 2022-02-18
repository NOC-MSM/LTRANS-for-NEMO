# LTRANS-for-NEMO

This is the [LTRANSv2 code](https://northweb.hpl.umces.edu/LTRANS.htm) modified to work with NEMO. 

Vtransform = 5 in the input file LTRANS.data was added to activate it. 

Main code changes make LTRANS understands the vertical grid of NEMO. 
The following routines were modified:

- parameter_module.f90

- initGrid() in hydrodynamic_module.f90

- LTRANS.f90

Also, a ***Lophelia*** bahavior was added in behaviour_module.f90, as described in:

Henry L-A, Mayorga-Adame CG, Fox AD, Polton JA, Ferris JS, McLellan F, McCabe C, Kutti T, Roberts JM (2018) Ocean sprawl facilitates dispersal and connectivity of protected species. Scientific Reports 8:11346. https://doi.org/10.1038/s41598-018-29575-4

Behavior = 8 in LTRANS.data activates it.

Since most variable names weren't changed within LTRANS, it still requiers a NEMO grid file with variables renamed as a ROMS grid.
For NEMO 3.6 used here, these variables were gathered from the mesh_mask.nc file. In newer versions of NEMO the required variables are in the domain_cfg.nc file. 
The header of the renamed netCDF grid file is provided as an example:
- netCDFHeader_NSs2_mesh_mask_renamed.txt

As Is, this code is a working verison with a North Sea subdomain of the AMM60 NEMO model application described in:

Guihou K, Polton J, Harle J, Wakelin S, O’Dea E, Holt J (2018) Kilometric Scale Modeling of the North West European Shelf Seas: Exploring the Spatial and Temporal Variability of Internal Tides. J Geophys Res Oceans 123:688–707. http://doi.wiley.com/10.1002/2017JC012960


