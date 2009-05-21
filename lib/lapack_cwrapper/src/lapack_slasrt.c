/*
 * lapack_slasrt.c
 *
 *This program is a C interface to slasrt.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slasrt(const enum lapack_sort_type id, const int n, float * d, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_id;
#else
	#define F77_id C_id
#endif

	char C_id=' ';
	if (id == lapack_increasing_order) {
		 C_id = 'I';
	} else if (id == lapack_decreasing_order) {
		 C_id = 'D';
	}

#ifdef F77_CHAR
	F77_id = C2F_CHAR(&C_id)
#endif

	f77_slasrt(&F77_id, &F77_n, d, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
