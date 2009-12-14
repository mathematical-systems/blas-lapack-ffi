/*
 * lapack_clarz.c
 *
 *This program is a C interface to clarz.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_clarz(const enum lapack_side_type side, const int m, const int n, const int l, const void * v, const int incv, const void * tau, void * c, const int ldc, void * work )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_l=l, F77_incv=incv, F77_ldc=ldc;
#else
	#define F77_m m
	#define F77_n n
	#define F77_l l
	#define F77_incv incv
	#define F77_ldc ldc
#endif

#ifdef F77_CHAR
	F77_CHAR F77_side;
#else
	#define F77_side C_side
#endif

	char C_side=' ';
	if (side == lapack_left_side) {
		 C_side = 'L';
	} else if (side == lapack_right_side) {
		 C_side = 'R';
	}

#ifdef F77_CHAR
	F77_side = C2F_CHAR(&C_side)
#endif

	f77_clarz(&F77_side, &F77_m, &F77_n, &F77_l, v, &F77_incv, tau, c, &F77_ldc, work);

#ifdef F77_INT
#endif

}
