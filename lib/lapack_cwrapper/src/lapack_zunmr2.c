/*
 * lapack_zunmr2.c
 *
 *This program is a C interface to zunmr2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zunmr2(const enum lapack_side_type side, const enum lapack_trans_type trans, const int m, const int n, const int k, const void * a, const int lda, const void * tau, void * c, const int ldc, void * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_k=k, F77_lda=lda, F77_ldc=ldc;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_m m
	#define F77_n n
	#define F77_k k
	#define F77_lda lda
	#define F77_ldc ldc
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_side, F77_trans;
#else
	#define F77_side C_side
	#define F77_trans C_trans
#endif

	char C_side=' ';
	if (side == lapack_left_side) {
		 C_side = 'L';
	} else if (side == lapack_right_side) {
		 C_side = 'R';
	}

	char C_trans=' ';
	if (trans == lapack_no_trans) {
		 C_trans = 'N';
	} else if (trans == lapack_trans) {
		 C_trans = 'T';
	} else if (trans == lapack_conj_trans) {
		 C_trans = 'C';
	}

#ifdef F77_CHAR
	F77_side = C2F_CHAR(&C_side)
	F77_trans = C2F_CHAR(&C_trans)
#endif

	f77_zunmr2(&F77_side, &F77_trans, &F77_m, &F77_n, &F77_k, a, &F77_lda, tau, c, &F77_ldc, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
