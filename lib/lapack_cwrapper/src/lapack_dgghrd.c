/*
 * lapack_dgghrd.c
 *
 *This program is a C interface to dgghrd.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dgghrd(const enum lapack_compute_type compq, const enum lapack_compute_type compz, const int n, const int ilo, const int ihi, double * a, const int lda, double * b, const int ldb, double * q, const int ldq, double * z, const int ldz, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ilo=ilo, F77_ihi=ihi, F77_lda=lda, F77_ldb=ldb, F77_ldq=ldq, F77_ldz=ldz;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ilo ilo
	#define F77_ihi ihi
	#define F77_lda lda
	#define F77_ldb ldb
	#define F77_ldq ldq
	#define F77_ldz ldz
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_compq, F77_compz;
#else
	#define F77_compq C_compq
	#define F77_compz C_compz
#endif

	char C_compq=' ';
	if (compq == lapack_not_compute) {
		 C_compq = 'N';
	} else if (compq == lapack_unitary) {
		 C_compq = 'I';
	} else if (compq == lapack_product) {
		 C_compq = 'V';
	}

	char C_compz=' ';
	if (compz == lapack_not_compute) {
		 C_compz = 'N';
	} else if (compz == lapack_unitary) {
		 C_compz = 'I';
	} else if (compz == lapack_product) {
		 C_compz = 'V';
	}

#ifdef F77_CHAR
	F77_compq = C2F_CHAR(&C_compq)
	F77_compz = C2F_CHAR(&C_compz)
#endif

	f77_dgghrd(&F77_compq, &F77_compz, &F77_n, &F77_ilo, &F77_ihi, a, &F77_lda, b, &F77_ldb, q, &F77_ldq, z, &F77_ldz, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
