/*
 * lapack_zhseqr.c
 *
 *This program is a C interface to zhseqr.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zhseqr(const enum lapack_hseqr_type job, const enum lapack_compute_type compz, const int n, const int ilo, const int ihi, void * h, const int ldh, void * w, void * z, const int ldz, void * work, const int lwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ilo=ilo, F77_ihi=ihi, F77_ldh=ldh, F77_ldz=ldz, F77_lwork=lwork;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ilo ilo
	#define F77_ihi ihi
	#define F77_ldh ldh
	#define F77_ldz ldz
	#define F77_lwork lwork
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_job, F77_compz;
#else
	#define F77_job C_job
	#define F77_compz C_compz
#endif

	char C_job=' ';
	if (job == lapack_eigenvalues) {
		 C_job = 'E';
	} else if (job == lapack_schur_form) {
		 C_job = 'S';
	}

	char C_compz=' ';
	if (compz == lapack_not_compute) {
		 C_compz = 'N';
	} else if (compz == lapack_unitary) {
		 C_compz = 'I';
	} else if (compz == lapack_product) {
		 C_compz = 'V';
	}

#ifdef F77_CHAR
	F77_job = C2F_CHAR(&C_job)
	F77_compz = C2F_CHAR(&C_compz)
#endif

	f77_zhseqr(&F77_job, &F77_compz, &F77_n, &F77_ilo, &F77_ihi, h, &F77_ldh, w, z, &F77_ldz, work, &F77_lwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
