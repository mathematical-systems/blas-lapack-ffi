/*
 * lapack_zlantr.c
 *
 *This program is a C interface to zlantr.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

double lapack_zlantr(const enum lapack_norm_type norm, const enum lapack_uplo_type uplo, const enum lapack_diag_type diag, const int m, const int n, const void * a, const int lda, double * work )
{

	double output;

#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_lda=lda;
#else
	#define F77_m m
	#define F77_n n
	#define F77_lda lda
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

	f77_zlantr(&output, &F77_norm, &F77_uplo, &F77_diag, &F77_m, &F77_n, a, &F77_lda, work);

#ifdef F77_INT
#endif

return output;
}
