/*
 * lapack_claed0.c
 *
 *This program is a C interface to claed0.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_claed0(const int qsiz, const int n, float * d, float * e, void * q, const int ldq, int * iwork, float * rwork, void * qstore, const int ldqs, int * info )
{
#ifdef F77_INT
	F77_INT F77_qsiz=qsiz, F77_n=n, F77_ldq=ldq, F77_ldqs=ldqs;
	#define F77_iwork iwork
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_qsiz qsiz
	#define F77_n n
	#define F77_ldq ldq
	#define F77_iwork iwork
	#define F77_ldqs ldqs
	#define F77_info info
#endif

	f77_claed0(&F77_qsiz, &F77_n, d, e, q, &F77_ldq, F77_iwork, rwork, qstore, &F77_ldqs, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
