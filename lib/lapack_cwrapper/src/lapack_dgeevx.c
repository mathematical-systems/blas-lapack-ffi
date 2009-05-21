/*
 * lapack_dgeevx.c
 *
 *This program is a C interface to dgeevx.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dgeevx(const enum lapack_balance_type balanc, const enum lapack_compute_vectors_type jobvl, const enum lapack_compute_vectors_type jobvr, const enum lapack_reciprocal_condition_type sense, const int n, double * a, const int lda, double * wr, double * wi, double * vl, const int ldvl, double * vr, const int ldvr, int * ilo, int * ihi, double * scale, double * abnrm, double * rconde, double * rcondv, double * work, const int lwork, int * iwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lda=lda, F77_ldvl=ldvl, F77_ldvr=ldvr, F77_lwork=lwork;
	int i_local;
	F77_INT F77_ilo[1];
	F77_INT F77_ihi[1];
	#define F77_iwork iwork
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_lda lda
	#define F77_ldvl ldvl
	#define F77_ldvr ldvr
	#define F77_ilo ilo
	#define F77_ihi ihi
	#define F77_lwork lwork
	#define F77_iwork iwork
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_balanc, F77_jobvl, F77_jobvr, F77_sense;
#else
	#define F77_balanc C_balanc
	#define F77_jobvl C_jobvl
	#define F77_jobvr C_jobvr
	#define F77_sense C_sense
#endif

	char C_balanc=' ';
	if (balanc == lapack_nothing) {
		 C_balanc = 'N';
	} else if (balanc == lapack_permute) {
		 C_balanc = 'P';
	} else if (balanc == lapack_scale) {
		 C_balanc = 'S';
	} else if (balanc == lapack_permute_scale) {
		 C_balanc = 'B';
	}

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

	char C_sense=' ';
	if (sense == lapack_no_reciprocal) {
		 C_sense = 'N';
	} else if (sense == lapack_average_selected) {
		 C_sense = 'E';
	} else if (sense == lapack_selected_right_subspace) {
		 C_sense = 'V';
	} else if (sense == lapack_both_reciprocal) {
		 C_sense = 'B';
	}

#ifdef F77_CHAR
	F77_balanc = C2F_CHAR(&C_balanc)
	F77_jobvl = C2F_CHAR(&C_jobvl)
	F77_jobvr = C2F_CHAR(&C_jobvr)
	F77_sense = C2F_CHAR(&C_sense)
#endif

	f77_dgeevx(&F77_balanc, &F77_jobvl, &F77_jobvr, &F77_sense, &F77_n, a, &F77_lda, wr, wi, vl, &F77_ldvl, vr, &F77_ldvr, F77_ilo, F77_ihi, scale, abnrm, rconde, rcondv, work, &F77_lwork, F77_iwork, F77_info);

#ifdef F77_INT
	ilo[0]=(int) F77_ilo[0];
	ihi[0]=(int) F77_ihi[0];
	info[0]=(int) F77_info[0];
#endif

}
