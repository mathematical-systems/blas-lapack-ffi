/*
 * lapack_slamch.c
 *
 *This program is a C interface to slamch.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

float lapack_slamch(const enum lapack_cmach_type cmach )
{

	float output;

#ifdef F77_INT
#else
#endif

#ifdef F77_CHAR
	F77_CHAR F77_cmach;
#else
	#define F77_cmach C_cmach
#endif

	char C_cmach=' ';
	if (cmach == lapack_eps) {
		 C_cmach = 'E';
	} else if (cmach == lapack_sfmin) {
		 C_cmach = 'S';
	} else if (cmach == lapack_base) {
		 C_cmach = 'B';
	} else if (cmach == lapack_epsbase) {
		 C_cmach = 'P';
	} else if (cmach == lapack_t) {
		 C_cmach = 'N';
	} else if (cmach == lapack_rnd) {
		 C_cmach = 'R';
	} else if (cmach == lapack_emin) {
		 C_cmach = 'M';
	} else if (cmach == lapack_rmin) {
		 C_cmach = 'U';
	} else if (cmach == lapack_emax) {
		 C_cmach = 'L';
	} else if (cmach == lapack_rmax) {
		 C_cmach = 'O';
	}

#ifdef F77_CHAR
	F77_cmach = C2F_CHAR(&C_cmach)
#endif

	f77_slamch(&output, &F77_cmach);

#ifdef F77_INT
#endif

return output;
}
