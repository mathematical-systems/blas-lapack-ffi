/*
 * lapack_slantp.c
 *
 *This program is a C interface to slantp.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

float lapack_slantp(const enum lapack_norm_type norm, const enum lapack_uplo_type uplo, const enum lapack_diag_type diag, const int n, const float * ap, float * work )
{

	float output;

#ifdef F77_INT
	F77_INT F77_n=n;
#else
	#define F77_n n
#endif

#ifdef F77_CHAR
	F77_CHAR F77_norm, F77_uplo, F77_diag;
#else
	#define F77_norm C_norm
	#define F77_uplo C_uplo
	#define F77_diag C_diag
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

	char C_diag=' ';
	if (diag == lapack_non_unit_diag) {
		 C_diag = 'N';
	} else if (diag == lapack_unit_diag) {
		 C_diag = 'U';
	}

#ifdef F77_CHAR
	F77_norm = C2F_CHAR(&C_norm)
	F77_uplo = C2F_CHAR(&C_uplo)
	F77_diag = C2F_CHAR(&C_diag)
#endif

	f77_slantp(&output, &F77_norm, &F77_uplo, &F77_diag, &F77_n, ap, work);

#ifdef F77_INT
#endif

return output;
}
