/*
 * lapack_dstev.c
 *
 *This program is a C interface to dstev.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dstev(const enum lapack_compute_vectors_type jobz, const int n, double * d, double * e, double * z, const int ldz, double * work, int * info )
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
	F77_CHAR F77_jobz;
#else
	#define F77_jobz C_jobz
#endif

	char C_jobz=' ';
	if (jobz == lapack_no_compute_vectors) {
		 C_jobz = 'N';
	} else if (jobz == lapack_compute_vectors) {
		 C_jobz = 'V';
	}

#ifdef F77_CHAR
	F77_jobz = C2F_CHAR(&C_jobz)
#endif

	f77_dstev(&F77_jobz, &F77_n, d, e, z, &F77_ldz, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
