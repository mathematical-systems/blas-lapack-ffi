/*
 * lapack_slaed0.c
 *
 *This program is a C interface to slaed0.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slaed0(const int icompq, const int qsiz, const int n, float * d, const float * e, float * q, const int ldq, float * qstore, const int ldqs, float * work, int * iwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_icompq=icompq, F77_qsiz=qsiz, F77_n=n, F77_ldq=ldq, F77_ldqs=ldqs;
	#define F77_iwork iwork
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_icompq icompq
	#define F77_qsiz qsiz
	#define F77_n n
	#define F77_ldq ldq
	#define F77_ldqs ldqs
	#define F77_iwork iwork
	#define F77_info info
#endif

	f77_slaed0(&F77_icompq, &F77_qsiz, &F77_n, d, e, q, &F77_ldq, qstore, &F77_ldqs, work, F77_iwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
