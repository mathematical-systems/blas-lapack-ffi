/*
 * lapack_ztrsen.c
 *
 *This program is a C interface to ztrsen.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_ztrsen(const enum lapack_compute_cond_type job, const enum lapack_compute_type compq, const long int * select, const int n, void * t, const int ldt, void * q, const int ldq, void * w, int * m, double * s, double * sep, void * work, const int lwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ldt=ldt, F77_ldq=ldq, F77_lwork=lwork;
	int i_local;
	F77_INT F77_m[1];
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ldt ldt
	#define F77_ldq ldq
	#define F77_m m
	#define F77_lwork lwork
	#define F77_info info
#endif

#ifdef F77_LOG
;
	int j_local;
	F77_LOG F77_select[n*1];
	for(j_local=0;j_local<n*1;j_local++) {
		F77_select[j_local]=(F77_LOG) select[j_local];
	}
#else
	#define F77_select select
#endif

#ifdef F77_CHAR
	F77_CHAR F77_job, F77_compq;
#else
	#define F77_job C_job
	#define F77_compq C_compq
#endif

	char C_job=' ';
	if (job == lapack_cond_eigenvalues) {
		 C_job = 'E';
	} else if (job == lapack_cond_eigenvectors) {
		 C_job = 'V';
	} else if (job == lapack_no_cond) {
		 C_job = 'N';
	} else if (job == lapack_cond_both) {
		 C_job = 'B';
	}

	char C_compq=' ';
	if (compq == lapack_not_compute) {
		 C_compq = 'N';
	} else if (compq == lapack_unitary) {
		 C_compq = 'I';
	} else if (compq == lapack_product) {
		 C_compq = 'V';
	}

#ifdef F77_CHAR
	F77_job = C2F_CHAR(&C_job)
	F77_compq = C2F_CHAR(&C_compq)
#endif

	f77_ztrsen(&F77_job, &F77_compq, F77_select, &F77_n, t, &F77_ldt, q, &F77_ldq, w, F77_m, s, sep, work, &F77_lwork, F77_info);

#ifdef F77_INT
	m[0]=(int) F77_m[0];
	info[0]=(int) F77_info[0];
#endif

#ifdef F77_LOG
#endif

}
