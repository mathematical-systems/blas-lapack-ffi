/*
 * lapack_cgbbrd.c
 *
 *This program is a C interface to cgbbrd.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_cgbbrd(const enum lapack_form_matrices_type vect, const int m, const int n, const int ncc, const int kl, const int ku, void * ab, const int ldab, float * d, float * e, void * q, const int ldq, void * pt, const int ldpt, void * c, const int ldc, void * work, float * rwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_ncc=ncc, F77_kl=kl, F77_ku=ku, F77_ldab=ldab, F77_ldq=ldq, F77_ldpt=ldpt, F77_ldc=ldc;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_m m
	#define F77_n n
	#define F77_ncc ncc
	#define F77_kl kl
	#define F77_ku ku
	#define F77_ldab ldab
	#define F77_ldq ldq
	#define F77_ldpt ldpt
	#define F77_ldc ldc
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_vect;
#else
	#define F77_vect C_vect
#endif

	char C_vect=' ';
	if (vect == lapack_form_none) {
		 C_vect = 'N';
	} else if (vect == lapack_form_qm) {
		 C_vect = 'Q';
	} else if (vect == lapack_form_pp) {
		 C_vect = 'P';
	} else if (vect == lapack_form_both) {
		 C_vect = 'B';
	}

#ifdef F77_CHAR
	F77_vect = C2F_CHAR(&C_vect)
#endif

	f77_cgbbrd(&F77_vect, &F77_m, &F77_n, &F77_ncc, &F77_kl, &F77_ku, ab, &F77_ldab, d, e, q, &F77_ldq, pt, &F77_ldpt, c, &F77_ldc, work, rwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
