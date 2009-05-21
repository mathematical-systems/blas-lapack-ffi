/*
 * lapack_zlatrs.c
 *
 *This program is a C interface to zlatrs.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zlatrs(const enum lapack_uplo_type uplo, const enum lapack_trans_type trans, const enum lapack_diag_type diag, const enum lapack_column_norm_type normin, const int n, const void * a, const int lda, void * x, double * scale, double * cnorm, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lda=lda;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_lda lda
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_uplo, F77_trans, F77_diag, F77_normin;
#else
	#define F77_uplo C_uplo
	#define F77_trans C_trans
	#define F77_diag C_diag
	#define F77_normin C_normin
#endif

	char C_uplo=' ';
	if (uplo == lapack_upper) {
		 C_uplo = 'U';
	} else if (uplo == lapack_lower) {
		 C_uplo = 'L';
	}

	char C_trans=' ';
	if (trans == lapack_no_trans) {
		 C_trans = 'N';
	} else if (trans == lapack_trans) {
		 C_trans = 'T';
	} else if (trans == lapack_conj_trans) {
		 C_trans = 'C';
	}

	char C_diag=' ';
	if (diag == lapack_non_unit_diag) {
		 C_diag = 'N';
	} else if (diag == lapack_unit_diag) {
		 C_diag = 'U';
	}

	char C_normin=' ';
	if (normin == lapack_column_norm) {
		 C_normin = 'Y';
	} else if (normin == lapack_no_column_norm) {
		 C_normin = 'N';
	}

#ifdef F77_CHAR
	F77_uplo = C2F_CHAR(&C_uplo)
	F77_trans = C2F_CHAR(&C_trans)
	F77_diag = C2F_CHAR(&C_diag)
	F77_normin = C2F_CHAR(&C_normin)
#endif

	f77_zlatrs(&F77_uplo, &F77_trans, &F77_diag, &F77_normin, &F77_n, a, &F77_lda, x, scale, cnorm, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
