/*
 * lapack_cpteqr.c
 *
 *This program is a C interface to cpteqr.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_cpteqr(const enum lapack_compute_type compz, const int n, float * d, float * e, void * z, const int ldz, float * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ldz=ldz;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ldz ldz
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_compz;
#else
	#define F77_compz C_compz
#endif

	char C_compz=' ';
	if (compz == lapack_not_compute) {
		 C_compz = 'N';
	} else if (compz == lapack_unitary) {
		 C_compz = 'I';
	} else if (compz == lapack_product) {
		 C_compz = 'V';
	}

#ifdef F77_CHAR
	F77_compz = C2F_CHAR(&C_compz)
#endif

	f77_cpteqr(&F77_compz, &F77_n, d, e, z, &F77_ldz, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
