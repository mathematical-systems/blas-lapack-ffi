/*
 * lapack_clarzb.c
 *
 *This program is a C interface to clarzb.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_clarzb(const enum lapack_side_type side, const enum lapack_trans_type trans, const enum lapack_direction_type direct, const enum lapack_store_type storev, const int m, const int n, const int k, const int l, const void * v, const int ldv, const void * t, const int ldt, void * c, const int ldc, void * work, const int ldwork )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_k=k, F77_l=l, F77_ldv=ldv, F77_ldt=ldt, F77_ldc=ldc, F77_ldwork=ldwork;
#else
	#define F77_m m
	#define F77_n n
	#define F77_k k
	#define F77_l l
	#define F77_ldv ldv
	#define F77_ldt ldt
	#define F77_ldc ldc
	#define F77_ldwork ldwork
#endif

#ifdef F77_CHAR
	F77_CHAR F77_side, F77_trans, F77_direct, F77_storev;
#else
	#define F77_side C_side
	#define F77_trans C_trans
	#define F77_direct C_direct
	#define F77_storev C_storev
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

	char C_direct=' ';
	if (direct == lapack_forward) {
		 C_direct = 'F';
	} else if (direct == lapack_backward) {
		 C_direct = 'B';
	}

	char C_storev=' ';
	if (storev == lapack_columnwise) {
		 C_storev = 'C';
	} else if (storev == lapack_rowwise) {
		 C_storev = 'R';
	}

#ifdef F77_CHAR
	F77_side = C2F_CHAR(&C_side)
	F77_trans = C2F_CHAR(&C_trans)
	F77_direct = C2F_CHAR(&C_direct)
	F77_storev = C2F_CHAR(&C_storev)
#endif

	f77_clarzb(&F77_side, &F77_trans, &F77_direct, &F77_storev, &F77_m, &F77_n, &F77_k, &F77_l, v, &F77_ldv, t, &F77_ldt, c, &F77_ldc, work, &F77_ldwork);

#ifdef F77_INT
#endif

}
