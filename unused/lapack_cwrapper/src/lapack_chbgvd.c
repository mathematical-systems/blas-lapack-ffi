/*
 * lapack_chbgvd.c
 *
 *This program is a C interface to chbgvd.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_chbgvd(const enum lapack_compute_vectors_type jobz, const enum lapack_uplo_type uplo, const int n, const int ka, const int kb, void * ab, const int ldab, void * bb, const int ldbb, float * w, void * z, const int ldz, void * work, const int lwork, float * rwork, const int lrwork, int * iwork, const int liwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ka=ka, F77_kb=kb, F77_ldab=ldab, F77_ldbb=ldbb, F77_ldz=ldz, F77_lwork=lwork, F77_lrwork=lrwork, F77_liwork=liwork;
	#define F77_iwork iwork
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ka ka
	#define F77_kb kb
	#define F77_ldab ldab
	#define F77_ldbb ldbb
	#define F77_ldz ldz
	#define F77_lwork lwork
	#define F77_lrwork lrwork
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

	f77_chbgvd(&F77_jobz, &F77_uplo, &F77_n, &F77_ka, &F77_kb, ab, &F77_ldab, bb, &F77_ldbb, w, z, &F77_ldz, work, &F77_lwork, rwork, &F77_lrwork, F77_iwork, &F77_liwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
