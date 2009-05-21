/*
 * lapack_zgeev.c
 *
 *This program is a C interface to zgeev.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zgeev(const enum lapack_compute_vectors_type jobvl, const enum lapack_compute_vectors_type jobvr, const int n, void * a, const int lda, void * w, void * vl, const int ldvl, void * vr, const int ldvr, void * work, const int lwork, double * rwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lda=lda, F77_ldvl=ldvl, F77_ldvr=ldvr, F77_lwork=lwork;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_lda lda
	#define F77_ldvl ldvl
	#define F77_ldvr ldvr
	#define F77_lwork lwork
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_jobvl, F77_jobvr;
#else
	#define F77_jobvl C_jobvl
	#define F77_jobvr C_jobvr
#endif

	char C_jobvl=' ';
	if (jobvl == lapack_no_compute_vectors) {
		 C_jobvl = 'N';
	} else if (jobvl == lapack_compute_vectors) {
		 C_jobvl = 'V';
	}

	char C_jobvr=' ';
	if (jobvr == lapack_no_compute_vectors) {
		 C_jobvr = 'N';
	} else if (jobvr == lapack_compute_vectors) {
		 C_jobvr = 'V';
	}

#ifdef F77_CHAR
	F77_jobvl = C2F_CHAR(&C_jobvl)
	F77_jobvr = C2F_CHAR(&C_jobvr)
#endif

	f77_zgeev(&F77_jobvl, &F77_jobvr, &F77_n, a, &F77_lda, w, vl, &F77_ldvl, vr, &F77_ldvr, work, &F77_lwork, rwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
