/*
 * lapack_zptsvx.c
 *
 *This program is a C interface to zptsvx.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zptsvx(const enum lapack_fact_type fact, const int n, const int nrhs, const double * d, const void * e, double * df, void * ef, const void * b, const int ldb, void * x, const int ldx, double * rcond, double * ferr, double * berr, void * work, double * rwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_nrhs=nrhs, F77_ldb=ldb, F77_ldx=ldx;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_nrhs nrhs
	#define F77_ldb ldb
	#define F77_ldx ldx
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_fact;
#else
	#define F77_fact C_fact
#endif

	char C_fact=' ';
	if (fact == lapack_fact_f) {
		 C_fact = 'F';
	} else if (fact == lapack_fact_n) {
		 C_fact = 'N';
	} else if (fact == lapack_fact_e) {
		 C_fact = 'E';
	}

#ifdef F77_CHAR
	F77_fact = C2F_CHAR(&C_fact)
#endif

	f77_zptsvx(&F77_fact, &F77_n, &F77_nrhs, d, e, df, ef, b, &F77_ldb, x, &F77_ldx, rcond, ferr, berr, work, rwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
