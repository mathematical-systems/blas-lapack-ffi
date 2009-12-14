/*
 * lapack_zlasr.c
 *
 *This program is a C interface to zlasr.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zlasr(const enum lapack_side_type side, const enum lapack_pivot_type pivot, const enum lapack_direction_type direct, const int m, const int n, const double * c, const double * s, void * a, const int lda )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_lda=lda;
#else
	#define F77_m m
	#define F77_n n
	#define F77_lda lda
#endif

#ifdef F77_CHAR
	F77_CHAR F77_side, F77_pivot, F77_direct;
#else
	#define F77_side C_side
	#define F77_pivot C_pivot
	#define F77_direct C_direct
#endif

	char C_side=' ';
	if (side == lapack_left_side) {
		 C_side = 'L';
	} else if (side == lapack_right_side) {
		 C_side = 'R';
	}

	char C_pivot=' ';
	if (pivot == lapack_variable) {
		 C_pivot = 'V';
	} else if (pivot == lapack_top) {
		 C_pivot = 'T';
	} else if (pivot == lapack_bottom) {
		 C_pivot = 'B';
	}

	char C_direct=' ';
	if (direct == lapack_forward) {
		 C_direct = 'F';
	} else if (direct == lapack_backward) {
		 C_direct = 'B';
	}

#ifdef F77_CHAR
	F77_side = C2F_CHAR(&C_side)
	F77_pivot = C2F_CHAR(&C_pivot)
	F77_direct = C2F_CHAR(&C_direct)
#endif

	f77_zlasr(&F77_side, &F77_pivot, &F77_direct, &F77_m, &F77_n, c, s, a, &F77_lda);

#ifdef F77_INT
#endif

}
