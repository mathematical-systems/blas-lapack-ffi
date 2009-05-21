/*
 * lapack_zlangb.c
 *
 *This program is a C interface to zlangb.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

double lapack_zlangb(const enum lapack_norm_type norm, const int n, const int kl, const int ku, const void * ab, const int ldab, double * work )
{

	double output;

#ifdef F77_INT
	F77_INT F77_n=n, F77_kl=kl, F77_ku=ku, F77_ldab=ldab;
#else
	#define F77_n n
	#define F77_kl kl
	#define F77_ku ku
	#define F77_ldab ldab
#endif

#ifdef F77_CHAR
	F77_CHAR F77_norm;
#else
	#define F77_norm C_norm
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

#ifdef F77_CHAR
	F77_norm = C2F_CHAR(&C_norm)
#endif

	f77_zlangb(&output, &F77_norm, &F77_n, &F77_kl, &F77_ku, ab, &F77_ldab, work);

#ifdef F77_INT
#endif

return output;
}
