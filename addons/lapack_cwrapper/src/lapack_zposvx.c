/*
 * lapack_zposvx.c
 *
 *This program is a C interface to zposvx.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zposvx(const enum lapack_fact_type fact, const enum lapack_uplo_type uplo, const int n, const int nrhs, void * a, const int lda, void * af, const int ldaf, char * equed, double * s, void * b, const int ldb, void * x, const int ldx, double * rcond, double * ferr, double * berr, void * work, double * rwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_nrhs=nrhs, F77_lda=lda, F77_ldaf=ldaf, F77_ldb=ldb, F77_ldx=ldx;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_nrhs nrhs
	#define F77_lda lda
	#define F77_ldaf ldaf
	#define F77_ldb ldb
	#define F77_ldx ldx
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

#ifdef F77_CHAR
	F77_CHAR F77_equed = C2F_STR(equed, strlen(equed)) ;
#else
	#define F77_equed equed
#endif

	f77_zposvx(&F77_fact, &F77_uplo, &F77_n, &F77_nrhs, a, &F77_lda, af, &F77_ldaf, equed, s, b, &F77_ldb, x, &F77_ldx, rcond, ferr, berr, work, rwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
