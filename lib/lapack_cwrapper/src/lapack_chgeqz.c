/*
 * lapack_chgeqz.c
 *
 *This program is a C interface to chgeqz.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_chgeqz(const enum lapack_hseqr_type job, const enum lapack_compute_type compq, const enum lapack_compute_type compz, const int n, const int ilo, const int ihi, void * h, const int ldh, void * t, const int ldt, void * alpha, void * beta, void * q, const int ldq, void * z, const int ldz, void * work, const int lwork, float * rwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ilo=ilo, F77_ihi=ihi, F77_ldh=ldh, F77_ldt=ldt, F77_ldq=ldq, F77_ldz=ldz, F77_lwork=lwork;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ilo ilo
	#define F77_ihi ihi
	#define F77_ldh ldh
	#define F77_ldt ldt
	#define F77_ldq ldq
	#define F77_ldz ldz
	#define F77_lwork lwork
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_job, F77_compq, F77_compz;
#else
	#define F77_job C_job
	#define F77_compq C_compq
	#define F77_compz C_compz
#endif

	char C_job=' ';
	if (job == lapack_eigenvalues) {
		 C_job = 'E';
	} else if (job == lapack_schur_form) {
		 C_job = 'S';
	}

	char C_compq=' ';
	if (compq == lapack_not_compute) {
		 C_compq = 'N';
	} else if (compq == lapack_unitary) {
		 C_compq = 'I';
	} else if (compq == lapack_product) {
		 C_compq = 'V';
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
	F77_compq = C2F_CHAR(&C_compq)
	F77_compz = C2F_CHAR(&C_compz)
#endif

	f77_chgeqz(&F77_job, &F77_compq, &F77_compz, &F77_n, &F77_ilo, &F77_ihi, h, &F77_ldh, t, &F77_ldt, alpha, beta, q, &F77_ldq, z, &F77_ldz, work, &F77_lwork, rwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
