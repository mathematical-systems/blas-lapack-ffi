/*
 * lapack_sspevd.c
 *
 *This program is a C interface to sspevd.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_sspevd(const enum lapack_compute_vectors_type jobz, const enum lapack_uplo_type uplo, const int n, float * ap, float * w, float * z, const int ldz, float * work, const int lwork, int * iwork, const int liwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ldz=ldz, F77_lwork=lwork, F77_liwork=liwork;
	#define F77_iwork iwork
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ldz ldz
	#define F77_lwork lwork
	#define F77_iwork iwork
	#define F77_liwork liwork
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_jobz, F77_uplo;
#else
	#define F77_jobz C_jobz
	#define F77_uplo C_uplo
#endif

	char C_jobz=' ';
	if (jobz == lapack_no_compute_vectors) {
		 C_jobz = 'N';
	} else if (jobz == lapack_compute_vectors) {
		 C_jobz = 'V';
	}

	char C_uplo=' ';
	if (uplo == lapack_upper) {
		 C_uplo = 'U';
	} else if (uplo == lapack_lower) {
		 C_uplo = 'L';
	}

#ifdef F77_CHAR
	F77_jobz = C2F_CHAR(&C_jobz)
	F77_uplo = C2F_CHAR(&C_uplo)
#endif

	f77_sspevd(&F77_jobz, &F77_uplo, &F77_n, ap, w, z, &F77_ldz, work, &F77_lwork, F77_iwork, &F77_liwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
