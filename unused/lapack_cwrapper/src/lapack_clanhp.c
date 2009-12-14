/*
 * lapack_clanhp.c
 *
 *This program is a C interface to clanhp.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

float lapack_clanhp(const enum lapack_norm_type norm, const enum lapack_uplo_type uplo, const int n, const void * ap, float * work )
{

	float output;

#ifdef F77_INT
	F77_INT F77_n=n;
#else
	#define F77_n n
#endif

#ifdef F77_CHAR
	F77_CHAR F77_norm, F77_uplo;
#else
	#define F77_norm C_norm
	#define F77_uplo C_uplo
#endif

	char C_norm=' ';
	if (norm == lapack_one_norm) {
		 C_norm = '1';
	} else if (norm == lapack_inf_norm) {
		 C_norm = 'I';
	} else if (norm == lapack_max_norm) {
		 C_norm = 'M';
	} else if (norm == lapack_frobenius_norm) {
		 C_norm = 'F';
	}

	char C_uplo=' ';
	if (uplo == lapack_upper) {
		 C_uplo = 'U';
	} else if (uplo == lapack_lower) {
		 C_uplo = 'L';
	}

#ifdef F77_CHAR
	F77_norm = C2F_CHAR(&C_norm)
	F77_uplo = C2F_CHAR(&C_uplo)
#endif

	f77_clanhp(&output, &F77_norm, &F77_uplo, &F77_n, ap, work);

#ifdef F77_INT
#endif

return output;
}
