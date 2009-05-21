/*
 * lapack_chbtrd.c
 *
 *This program is a C interface to chbtrd.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_chbtrd(const enum lapack_form_q_type vect, const enum lapack_uplo_type uplo, const int n, const int kd, void * ab, const int ldab, float * d, float * e, void * q, const int ldq, void * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_kd=kd, F77_ldab=ldab, F77_ldq=ldq;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_kd kd
	#define F77_ldab ldab
	#define F77_ldq ldq
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_vect, F77_uplo;
#else
	#define F77_vect C_vect
	#define F77_uplo C_uplo
#endif

	char C_vect=' ';
	if (vect == lapack_do_not_form_q) {
		 C_vect = 'N';
	} else if (vect == lapack_form_q) {
		 C_vect = 'V';
	} else if (vect == lapack_update_matrix) {
		 C_vect = 'U';
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

	f77_chbtrd(&F77_vect, &F77_uplo, &F77_n, &F77_kd, ab, &F77_ldab, d, e, q, &F77_ldq, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
