/*
 * lapack_dspsvx.c
 *
 *This program is a C interface to dspsvx.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dspsvx(const enum lapack_fact_type fact, const enum lapack_uplo_type uplo, const int n, const int nrhs, const double * ap, double * afp, int * ipiv, const double * b, const int ldb, double * x, const int ldx, double * rcond, double * ferr, double * berr, double * work, int * iwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_nrhs=nrhs, F77_ldb=ldb, F77_ldx=ldx;
	int i_local;
	F77_INT F77_ipiv[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_ipiv[i_local]=(F77_INT) ipiv[i_local];
	}
	#define F77_iwork iwork
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_nrhs nrhs
	#define F77_ipiv ipiv
	#define F77_ldb ldb
	#define F77_ldx ldx
	#define F77_iwork iwork
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_fact, F77_uplo;
#else
	#define F77_fact C_fact
	#define F77_uplo C_uplo
#endif

	char C_fact=' ';
	if (fact == lapack_fact_f) {
		 C_fact = 'F';
	} else if (fact == lapack_fact_n) {
		 C_fact = 'N';
	} else if (fact == lapack_fact_e) {
		 C_fact = 'E';
	}

	char C_uplo=' ';
	if (uplo == lapack_upper) {
		 C_uplo = 'U';
	} else if (uplo == lapack_lower) {
		 C_uplo = 'L';
	}

#ifdef F77_CHAR
	F77_fact = C2F_CHAR(&C_fact)
	F77_uplo = C2F_CHAR(&C_uplo)
#endif

	f77_dspsvx(&F77_fact, &F77_uplo, &F77_n, &F77_nrhs, ap, afp, F77_ipiv, b, &F77_ldb, x, &F77_ldx, rcond, ferr, berr, work, F77_iwork, F77_info);

#ifdef F77_INT
	for(i_local=0;i_local<n*1;i_local++) {
		ipiv[i_local]=(int) F77_ipiv[i_local];
	}

	info[0]=(int) F77_info[0];
#endif

}
