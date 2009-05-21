/*
 * lapack_ctgsja.c
 *
 *This program is a C interface to ctgsja.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_ctgsja(const enum lapack_compute_tgsj_type jobu, const enum lapack_compute_tgsj_type jobv, const enum lapack_compute_tgsj_type jobq, const int m, const int p, const int n, const int k, const int l, void * a, const int lda, void * b, const int ldb, const float tola, const float tolb, float * alpha, float * beta, void * u, const int ldu, void * v, const int ldv, void * q, const int ldq, void * work, int * ncycle, int * info )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_p=p, F77_n=n, F77_k=k, F77_l=l, F77_lda=lda, F77_ldb=ldb, F77_ldu=ldu, F77_ldv=ldv, F77_ldq=ldq;
	int i_local;
	F77_INT F77_ncycle[1];
	F77_INT F77_info[1];
#else
	#define F77_m m
	#define F77_p p
	#define F77_n n
	#define F77_k k
	#define F77_l l
	#define F77_lda lda
	#define F77_ldb ldb
	#define F77_ldu ldu
	#define F77_ldv ldv
	#define F77_ldq ldq
	#define F77_ncycle ncycle
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_jobu, F77_jobv, F77_jobq;
#else
	#define F77_jobu C_jobu
	#define F77_jobv C_jobv
	#define F77_jobq C_jobq
#endif

	char C_jobu=' ';
	if (jobu == lapack_ortho_u) {
		 C_jobu = 'U';
	} else if (jobu == lapack_ortho_v) {
		 C_jobu = 'V';
	} else if (jobu == lapack_ortho_q) {
		 C_jobu = 'Q';
	} else if (jobu == lapack_unit) {
		 C_jobu = 'I';
	} else if (jobu == lapack_do_not_compute) {
		 C_jobu = 'N';
	}

	char C_jobv=' ';
	if (jobv == lapack_ortho_u) {
		 C_jobv = 'U';
	} else if (jobv == lapack_ortho_v) {
		 C_jobv = 'V';
	} else if (jobv == lapack_ortho_q) {
		 C_jobv = 'Q';
	} else if (jobv == lapack_unit) {
		 C_jobv = 'I';
	} else if (jobv == lapack_do_not_compute) {
		 C_jobv = 'N';
	}

	char C_jobq=' ';
	if (jobq == lapack_ortho_u) {
		 C_jobq = 'U';
	} else if (jobq == lapack_ortho_v) {
		 C_jobq = 'V';
	} else if (jobq == lapack_ortho_q) {
		 C_jobq = 'Q';
	} else if (jobq == lapack_unit) {
		 C_jobq = 'I';
	} else if (jobq == lapack_do_not_compute) {
		 C_jobq = 'N';
	}

#ifdef F77_CHAR
	F77_jobu = C2F_CHAR(&C_jobu)
	F77_jobv = C2F_CHAR(&C_jobv)
	F77_jobq = C2F_CHAR(&C_jobq)
#endif

	f77_ctgsja(&F77_jobu, &F77_jobv, &F77_jobq, &F77_m, &F77_p, &F77_n, &F77_k, &F77_l, a, &F77_lda, b, &F77_ldb, &tola, &tolb, alpha, beta, u, &F77_ldu, v, &F77_ldv, q, &F77_ldq, work, F77_ncycle, F77_info);

#ifdef F77_INT
	ncycle[0]=(int) F77_ncycle[0];
	info[0]=(int) F77_info[0];
#endif

}
