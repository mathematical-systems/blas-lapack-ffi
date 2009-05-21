/*
 * lapack_dgehd2.c
 *
 *This program is a C interface to dgehd2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dgehd2(const int n, const int ilo, const int ihi, double * a, const int lda, double * tau, double * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ilo=ilo, F77_ihi=ihi, F77_lda=lda;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ilo ilo
	#define F77_ihi ihi
	#define F77_lda lda
	#define F77_info info
#endif

	f77_dgehd2(&F77_n, &F77_ilo, &F77_ihi, a, &F77_lda, tau, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
