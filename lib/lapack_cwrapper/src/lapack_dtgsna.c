/*
 * lapack_dtgsna.c
 *
 *This program is a C interface to dtgsna.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dtgsna(const enum lapack_balance_type job, const enum lapack_how_many_type howmny, const long int * select, const int n, const double * a, const int lda, const double * b, const int ldb, const double * vl, const int ldvl, const double * vr, const int ldvr, double * s, double * dif, const int mm, int * m, double * work, const int lwork, int * iwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lda=lda, F77_ldb=ldb, F77_ldvl=ldvl, F77_ldvr=ldvr, F77_mm=mm, F77_lwork=lwork;
	int i_local;
	F77_INT F77_m[1];
	F77_m[0]=(F77_INT) m[0];
	#define F77_iwork iwork
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_lda lda
	#define F77_ldb ldb
	#define F77_ldvl ldvl
	#define F77_ldvr ldvr
	#define F77_mm mm
	#define F77_m m
	#define F77_lwork lwork
	#define F77_iwork iwork
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
	if (job == lapack_nothing) {
		 C_job = 'N';
	} else if (job == lapack_permute) {
		 C_job = 'P';
	} else if (job == lapack_scale) {
		 C_job = 'S';
	} else if (job == lapack_permute_scale) {
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

	f77_dtgsna(&F77_job, &F77_howmny, F77_select, &F77_n, a, &F77_lda, b, &F77_ldb, vl, &F77_ldvl, vr, &F77_ldvr, s, dif, &F77_mm, F77_m, work, &F77_lwork, F77_iwork, F77_info);

#ifdef F77_INT
	m[0]=(int) F77_m[0];
	info[0]=(int) F77_info[0];
#endif

#ifdef F77_LOG
#endif

}
