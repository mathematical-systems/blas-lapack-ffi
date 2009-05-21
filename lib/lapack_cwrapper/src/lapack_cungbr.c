/*
 * lapack_cungbr.c
 *
 *This program is a C interface to cungbr.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_cungbr(const enum lapack_form_matrices_type vect, const int m, const int n, const int k, void * a, const int lda, const void * tau, void * work, const int lwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_k=k, F77_lda=lda, F77_lwork=lwork;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_m m
	#define F77_n n
	#define F77_k k
	#define F77_lda lda
	#define F77_lwork lwork
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

	f77_cungbr(&F77_vect, &F77_m, &F77_n, &F77_k, a, &F77_lda, tau, work, &F77_lwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
