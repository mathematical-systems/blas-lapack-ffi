/*
 * lapack_zpbrfs.c
 *
 *This program is a C interface to zpbrfs.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zpbrfs(const enum lapack_uplo_type uplo, const int n, const int kd, const int nrhs, const double * ab, const int ldab, const void * afb, const int ldafb, const void * b, const int ldb, void * x, const int ldx, double * ferr, double * berr, void * work, double * rwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_kd=kd, F77_nrhs=nrhs, F77_ldab=ldab, F77_ldafb=ldafb, F77_ldb=ldb, F77_ldx=ldx;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_kd kd
	#define F77_nrhs nrhs
	#define F77_ldab ldab
	#define F77_ldafb ldafb
	#define F77_ldb ldb
	#define F77_ldx ldx
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_uplo;
#else
	#define F77_uplo C_uplo
#endif

	char C_uplo=' ';
	if (uplo == lapack_upper) {
		 C_uplo = 'U';
	} else if (uplo == lapack_lower) {
		 C_uplo = 'L';
	}

#ifdef F77_CHAR
	F77_uplo = C2F_CHAR(&C_uplo)
#endif

	f77_zpbrfs(&F77_uplo, &F77_n, &F77_kd, &F77_nrhs, ab, &F77_ldab, afb, &F77_ldafb, b, &F77_ldb, x, &F77_ldx, ferr, berr, work, rwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
