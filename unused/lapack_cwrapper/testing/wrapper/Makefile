include ../../make.inc
include obj_list.in
#######################################################################
#  This is the makefile to create a library for LAPACK.
#  The files are organized as follows:
#       ALLAUX -- Auxiliary routines called from all precisions
#       SCLAUX -- Auxiliary routines called from both REAL and COMPLEX
#       DZLAUX -- Auxiliary routines called from both DOUBLE PRECISION
#                 and COMPLEX*16
#       SLASRC -- Single precision real LAPACK routines
#       CLASRC -- Single precision complex LAPACK routines
#       DLASRC -- Double precision real LAPACK routines
#       ZLASRC -- Double precision complex LAPACK routines
#
#  The library can be set up to include routines for any combination
#  of the four precisions.  To create or add to the library, enter make
#  followed by one or more of the precisions desired.  Some examples:
#       make single
#       make single complex
#       make single double complex complex16
#  Alternatively, the command
#       make
#  without any arguments creates a library of all four precisions.
#  The library is called
#       lapack.a
#  and is created at the next higher directory level.
#
#  To remove the object files after the library is created, enter
#       make clean
#  On some systems, you can force the source files to be recompiled by
#  entering (for example)
#       make single FRC=FRC
#
#  ***Note***
#  The functions lsame, second, dsecnd, slamch, and dlamch may have
#  to be installed before compiling the library.  Refer to the
#  installation guide, LAPACK Working Note 41, for instructions.
#
#######################################################################



all: single complex double complex16

single: $(SLASRC) $(AUXSRC)
	$(ARCH) $(ARCHFLAGS) $(TESTLIB) $(SLASRC) $(AUXSRC) 
	$(RANLIB) $(TESTLIB)

complex: $(CLASRC) single
	$(ARCH) $(ARCHFLAGS) $(TESTLIB) $(CLASRC) $(AUXSRC) \
	$(SLASRC)
	$(RANLIB) $(TESTLIB)

double: $(DLASRC) $(AUXSRC)
	$(ARCH) $(ARCHFLAGS) $(TESTLIB) $(DLASRC) $(AUXSRC)
	$(RANLIB) $(TESTLIB)

complex16: $(ZLASRC) double
	$(ARCH) $(ARCHFLAGS) $(TESTLIB) $(ZLASRC) $(AUXSRC) \
	$(DLASRC)
	$(RANLIB) $(TESTLIB)

$(ALLAUX): $(FRC)
$(SCLAUX): $(FRC)
$(DZLAUX): $(FRC)
$(SLASRC): $(FRC)
$(CLASRC): $(FRC)
$(DLASRC): $(FRC)
$(ZLASRC): $(FRC)

FRC:
	@FRC=$(FRC)

clean:
	rm -f *.o


.f.o: 
	$(FORTRAN) $(OPTS) -c $<

.c.o: 
	$(CC) $(OPTS) -c $<
