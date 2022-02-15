# LTRANS-for-NEMO

This is the [LTRANSv2 code](https://northweb.hpl.umces.edu/LTRANS.htm) modified to work with NEMO. 

Vtransform = 5 in the input file LTRANS.data was added to activate it. 

Main code changes make LTRANS understands the vertical grid of NEMO. 
The following routines were modified:

- parameter_module.f90,


- hydrodynamic_module.f90, initGrid()

- LTRANS.f90.

Also a Lophelia bahaviour was added in behaviour_module.f90, as described in:

Henry, LA., Mayorga-Adame, C.G., Fox, A.D. et al. Ocean sprawl facilitates dispersal and connectivity of protected species. Sci Rep 8, 11346 (2018). https://doi.org/10.1038/s41598-018-29575-4

Behavior = 8 in LTRANS.data activates it.

Since most variable names weren't changed within LTRANS, it still requiers a NEMO grid file with variables renamed as a ROMS grid.
For NEMO 3.6 used here, these variables were gathered from the mesh_mask.nc file. In newer versions of NEMO the required variables are in the domain_cfg.nc file. 
The header of the renamed netCDF grid file is provided as an example:
- netCDFHeader_NSs2_mesh_mask_renamed.txt
