#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                                                                       :::
#                          LTRANS Makefile                              :::
#                                                                       :::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


#==========================================================================
#                         USER-DEFINED OPTIONS                            =
#==========================================================================




#------------------------------------------------
#    Set compiler and flags
#------------------------------------------------
#
#    Turn one of the following on:
IFORT :=  
GFORTRAN :=  
PGF90 := on



ifdef PGF90 
  FC = mpif90
  NETCDF_INCDIR = /cm/shared/apps/netcdf/pgi/64/4.1.3/include
  NETCDF_LIBDIR = /cm/shared/apps/netcdf/pgi/64/4.1.3/lib
  FFLAGS = -mcmodel=medium -I$(NETCDF_INCDIR)
endif

ifdef IFORT 
  FC = ifort
  NETCDF_INCDIR = /cm/shared/apps/netcdf/pgi/64/4.1.3/include
  NETCDF_LIBDIR = /cm/shared/apps/netcdf/pgi/64/4.1.3/lib
  FFLAGS = -vec-report0 -fp-model precise -mcmodel=medium -I$(NETCDF_INCDIR)
endif

ifdef GFORTRAN
  FC = gfortran 
  NETCDF_INCDIR = /cm/shared/apps/netcdf-fortran/gcc/64/4.4.1/include
  NETCDF_LIBDIR = /cm/shared/apps/netcdf-fortran/gcc/64/4.4.1/lib 
  FFLAGS = -march=native -ffast-math -fno-cx-limited-range -O3 -funroll-loops --param max-unroll-times=4 -ffree-line-length-none -I$(NETCDF_INCDIR)
endif

#------------------------------------------------
#    Set NetCDF Library Locations.
#    If NetCDF was compiled with HDF5, set:
#        HDF5 := on
#    Otherwise, leave blank:
#        HDF5 :=
#------------------------------------------------

HDF5 :=

#==========================================================================
# End of user-defined options. Nothing should be changed below this point =
#==========================================================================

OBJS          = gridcell_module.o interpolation_module.o parameter_module.o \
				point_in_polygon_module.o random_module.o tension_module.o  \
				conversion_module.o hydrodynamic_module.o norm_module.o     \
				boundary_module.o hor_turb_module.o settlement_module.o     \
				ver_turb_module.o behavior_module.o

ifdef HDF5
   ifdef PGI_USGS
        LIBS      = -L$(NETCDF_LIBDIR) -lnetcdf -lnetcdff -L/share/apps/hdf5/lib -lhdf5 -lz -lm -L/share/apps/szip/lib -lsz -lcurl
   else
	LIBS      = -L$(NETCDF_LIBDIR) -lnetcdff -lnetcdf  -lhdf5 -lcurl
   endif
else
	LIBS      = -L$(NETCDF_LIBDIR) -lnetcdff -lnetcdf
endif


LTRANS : $(OBJS)
	@echo "  Compiling LTRANS.f90"
	@$(FC) $(FFLAGS) -o LTRANS.exe LTRANS.f90 $(OBJS) $(LIBS)
	@\rm *.o *.mod
	@echo "  "
	@echo "  Compilation Successfully Completed"
	@echo "  "

%.o: %.f90
	@echo "  Compiling $<"
	@$(FC) $(FFLAGS) -c $<

clean:
	\rm *.o *.mod LTRANS.exe

