/*
 * lapack_sbdsdc.c
 *
 *This program is a C interface to sbdsdc.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_sbdsdc(const enum lapack_uplo_type uplo, const enum lapack_compute_type compq, const int n, float * d, float * e, float * u, const int ldu, float * vt, const int ldvt, float * q, int * iq, float * work, int * iwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ldu=ldu, F77_ldvt=ldvt;
	int i;
	int ldiq = 1;
	F77_INT F77_iq[ldiq*1];
	for(i=0;i<ldiq*1;i++) {
		F77_iq[i]=(F77_INT) iq[i];
	}
	F77_INT F77_iwork[8*n*1];
	for(i=0;i<8*n*1;i++) {
		F77_iwork[i]=(F77_INT) iwork[i];
	}
	F77_INT F77_info[1];
	F77_info[0]=(F77_INT) info[0];
#else
	#define F77_n n
	#define F77_ldu ldu
	#define F77_ldvt ldvt
	#define F77_iq iq
	#define F77_iwork iwork
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_uplo, F77_compq;
#else
	#define F77_uplo C_uplo
	#define F77_compq C_compq
#endif

	char C_uplo=' ';
	if (uplo == lapack_upper) {
		 C_uplo = 'U';
	} else if (uplo == lapack_lower) {
		 C_uplo = 'L';
	}

	char C_compq=' ';
	if (compq == lapack_not_compute) {
		 C_compq = 'N';
	} else if (compq == lapack_unitary) {
		 C_compq = 'I';
	} else if (compq == lapack_product) {
		 C_compq = 'V';
	}

#ifdef F77_CHAR
	F77_uplo = C2F_CHAR(&C_uplo)
	F77_compq = C2F_CHAR(&C_compq)
#endif

	f77_sbdsdc(&F77_uplo, &F77_compq, &F77_n, d, e, u, &F77_ldu, vt, &F77_ldvt, q, F77_iq, work, F77_iwork, F77_info);

#ifdef F77_INT
	for(i=0;i<ldiq*1;i++) {
		iq[i]=(int) F77_iq[i];
	}

	for(i=0;i<8*n*1;i++) {
		iwork[i]=(int) F77_iwork[i];
	}

#endif

}
