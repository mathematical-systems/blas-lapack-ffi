/*
 * lapack_ssbgst.c
 *
 *This program is a C interface to ssbgst.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_ssbgst(const enum lapack_form_x_type vect, const enum lapack_uplo_type uplo, const int n, const int ka, const int kb, float * ab, const int ldab, const float * bb, const int ldbb, float * x, const int ldx, float * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ka=ka, F77_kb=kb, F77_ldab=ldab, F77_ldbb=ldbb, F77_ldx=ldx;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ka ka
	#define F77_kb kb
	#define F77_ldab ldab
	#define F77_ldbb ldbb
	#define F77_ldx ldx
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_vect, F77_uplo;
#else
	#define F77_vect C_vect
	#define F77_uplo C_uplo
#endif

	char C_vect=' ';
	if (vect == lapack_do_not_form_x) {
		 C_vect = 'N';
	} else if (vect == lapack_form_x) {
		 C_vect = 'V';
	}

	char C_uplo=' ';
	if (uplo == lapack_upper) {
		 C_uplo = 'U';
	} else if (uplo == lapack_lower) {
		 C_uplo = 'L';
	}

#ifdef F77_CHAR
	F77_vect = C2F_CHAR(&C_vect)
	F77_uplo = C2F_CHAR(&C_uplo)
#endif

	f77_ssbgst(&F77_vect, &F77_uplo, &F77_n, &F77_ka, &F77_kb, ab, &F77_ldab, bb, &F77_ldbb, x, &F77_ldx, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
