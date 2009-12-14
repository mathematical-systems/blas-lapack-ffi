/*
 * lapack_ztrsna.c
 *
 *This program is a C interface to ztrsna.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_ztrsna(const enum lapack_compute_cond_type job, const enum lapack_how_many_type howmny, const long int * select, const int n, const void * t, const int ldt, const void * vl, const int ldvl, const void * vr, const int ldvr, double * s, double * sep, const int mm, int * m, void * work, const int ldwork, double * rwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ldt=ldt, F77_ldvl=ldvl, F77_ldvr=ldvr, F77_mm=mm, F77_ldwork=ldwork;
	int i_local;
	F77_INT F77_m[1];
	F77_m[0]=(F77_INT) m[0];
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ldt ldt
	#define F77_ldvl ldvl
	#define F77_ldvr ldvr
	#define F77_mm mm
	#define F77_m m
	#define F77_ldwork ldwork
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
	F77_CHAR F77_job, F77_howmny;
#else
	#define F77_job C_job
	#define F77_howmny C_howmny
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

	char C_howmny=' ';
	if (howmny == lapack_all) {
		 C_howmny = 'A';
	} else if (howmny == lapack_backtransform) {
		 C_howmny = 'B';
	} else if (howmny == lapack_select) {
		 C_howmny = 'S';
	}

#ifdef F77_CHAR
	F77_job = C2F_CHAR(&C_job)
	F77_howmny = C2F_CHAR(&C_howmny)
#endif

	f77_ztrsna(&F77_job, &F77_howmny, F77_select, &F77_n, t, &F77_ldt, vl, &F77_ldvl, vr, &F77_ldvr, s, sep, &F77_mm, F77_m, work, &F77_ldwork, rwork, F77_info);

#ifdef F77_INT
	m[0]=(int) F77_m[0];
	info[0]=(int) F77_info[0];
#endif

#ifdef F77_LOG
#endif

}
