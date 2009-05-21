/*
 * lapack_slarft.c
 *
 *This program is a C interface to slarft.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slarft(const enum lapack_direction_type direct, const enum lapack_store_type storev, const int n, const int k, float * v, const int ldv, const float * tau, float * t, const int ldt )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_k=k, F77_ldv=ldv, F77_ldt=ldt;
#else
	#define F77_n n
	#define F77_k k
	#define F77_ldv ldv
	#define F77_ldt ldt
#endif

#ifdef F77_CHAR
	F77_CHAR F77_direct, F77_storev;
#else
	#define F77_direct C_direct
	#define F77_storev C_storev
#endif

	char C_direct=' ';
	if (direct == lapack_forward) {
		 C_direct = 'F';
	} else if (direct == lapack_backward) {
		 C_direct = 'B';
	}

	char C_storev=' ';
	if (storev == lapack_columnwise) {
		 C_storev = 'C';
	} else if (storev == lapack_rowwise) {
		 C_storev = 'R';
	}

#ifdef F77_CHAR
	F77_direct = C2F_CHAR(&C_direct)
	F77_storev = C2F_CHAR(&C_storev)
#endif

	f77_slarft(&F77_direct, &F77_storev, &F77_n, &F77_k, v, &F77_ldv, tau, t, &F77_ldt);

#ifdef F77_INT
#endif

}
