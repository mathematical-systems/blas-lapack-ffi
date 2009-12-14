/*
 * lapack_ilaver.c
 *
 *This program is a C interface to ilaver.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_ilaver(int * vers_major, int * vers_minor, int * vers_patch )
{
#ifdef F77_INT
	int i_local;
	F77_INT F77_vers_major[1];
	F77_INT F77_vers_minor[1];
	F77_INT F77_vers_patch[1];
#else
	#define F77_vers_major vers_major
	#define F77_vers_minor vers_minor
	#define F77_vers_patch vers_patch
#endif

	f77_ilaver(F77_vers_major, F77_vers_minor, F77_vers_patch);

#ifdef F77_INT
	vers_major[0]=(int) F77_vers_major[0];
	vers_minor[0]=(int) F77_vers_minor[0];
	vers_patch[0]=(int) F77_vers_patch[0];
#endif

}
