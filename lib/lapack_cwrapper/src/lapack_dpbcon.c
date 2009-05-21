/*
 * lapack_dpbcon.c
 *
 *This program is a C interface to dpbcon.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dpbcon(const enum lapack_uplo_type uplo, const int n, const int kd, const double * ab, const int ldab, const double anorm, double * rcond, double * work, int * iwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_kd=kd, F77_ldab=ldab;
	#define F77_iwork iwork
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_kd kd
	#define F77_ldab ldab
	#define F77_iwork iwork
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

	f77_dpbcon(&F77_uplo, &F77_n, &F77_kd, ab, &F77_ldab, &anorm, rcond, work, F77_iwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
