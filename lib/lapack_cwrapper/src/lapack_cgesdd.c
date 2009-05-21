/*
 * lapack_cgesdd.c
 *
 *This program is a C interface to cgesdd.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_cgesdd(const enum lapack_compute_svd_type jobz, const int m, const int n, void * a, const int lda, float * s, void * u, const int ldu, void * vt, const int ldvt, void * work, const int lwork, float * rwork, int * iwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_lda=lda, F77_ldu=ldu, F77_ldvt=ldvt, F77_lwork=lwork;
	#define F77_iwork iwork
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_m m
	#define F77_n n
	#define F77_lda lda
	#define F77_ldu ldu
	#define F77_ldvt ldvt
	#define F77_lwork lwork
	#define F77_iwork iwork
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_jobz;
#else
	#define F77_jobz C_jobz
#endif

	char C_jobz=' ';
	if (jobz == lapack_all_matrix) {
		 C_jobz = 'A';
	} else if (jobz == lapack_overwritte_u) {
		 C_jobz = 'S';
	} else if (jobz == lapack_overwritte_a) {
		 C_jobz = 'O';
	} else if (jobz == lapack_no_singular_vectors) {
		 C_jobz = 'N';
	}

#ifdef F77_CHAR
	F77_jobz = C2F_CHAR(&C_jobz)
#endif

	f77_cgesdd(&F77_jobz, &F77_m, &F77_n, a, &F77_lda, s, u, &F77_ldu, vt, &F77_ldvt, work, &F77_lwork, rwork, F77_iwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
