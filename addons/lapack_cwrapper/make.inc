####################################################################
#  LAPACK make include file.                                       #
#  LAPACK, Version 3.0                                             #
#  June 30, 1999                                                  #
####################################################################
#
SHELL = /bin/sh
#
#  The machine (platform) identifier to append to the library names
#
PLAT = _LINUX
#  
#  Modify the FORTRAN and OPTS definitions to refer to the
#  compiler and desired compiler options for your machine.  NOOPT
#  refers to the compiler options desired when NO OPTIMIZATION is
#  selected.  Define LOADER and LOADOPTS to refer to the loader and 
#  desired load options for your machine.
#
CC = gcc
FORTRAN  = g77
#OPTS     = -O3 -DADD_  -DF77_INT=int -DF77_LOG=int
#NOOPT    = -DADD_ -DF77_INT=int -DF77_LOG=int
OPTS     = -O3 -DADD_ -DF77_LOG=int -Wall
NOOPT    = -DADD_ -DF77_LOG=int -g -Wall
LOADER = g77
#
#  The archiver and the flag(s) to use when building archive (library)
#  If you system has no ranlib, set RANLIB = echo.
#
ARCH     = ar
ARCHFLAGS= cr
RANLIB   = echo
#
#  The location of the libraries to which you will link.  (The 
#  machine-specific, optimized BLAS library should be used whenever
#  possible.)
#
ROOT_DIR = /home/huang/workspace/intel-mkl-wrapper/lib/lapack_cwrapper/


BLASLIB     = /usr/local/lib/blas_LINUX.a 
LAPACKLIB    = /home/delmas/lib/lapack-dev/lapack/lapack_LINUX.a
CBLASLIB = /home/delmas/__auboulot__/CBLAS/lib/LINUX/cblas_LINUX.a


LAWRAPLIB = $(ROOT_DIR)/lib/liblapack_cwrapper.a
LIB = $(LAPACKLIB) $(CBLASLIB) $(BLASLIB) -lg2c
MTGLIB = $(ROOT_DIR)/testing/libmtg.a 
TESTLIB = $(ROOT_DIR)/testing/libtesting_wrapper_wrapper.a

LASRCDIR = /home/delmas/lib/lapack-dev/lapack/SRC

TEST_MAIN = $(ROOT_DIR)/testing/main
TEST_WRAPPER = $(ROOT_DIR)/testing/wrapper
TEST_LAPACK_CPREFIX = $(ROOT_DIR)/testing/lapack_cprefix
LAPACK_CPREFIX_LIB = $(TEST_LAPACK_CPREFIX)/lapack/libtesting_wrapper_lapack_cprefix.a
EXAMPLE_DIR = $(ROOT_DIR)/examples

DEMO_DIR = $(ROOT_DIR)/demo
SRC_DIR = $(ROOT_DIR)/src
INCLUDE = -I/home/delmas/__auboulot__/CBLAS/src/
