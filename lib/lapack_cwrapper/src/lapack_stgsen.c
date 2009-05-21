/*
 * lapack_stgsen.c
 *
 *This program is a C interface to stgsen.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_stgsen(const int ijob, const long int wantq, const long int wantz, const long int * select, const int n, float * a, const int lda, float * b, const int ldb, float * alphar, float * alphai, float * beta, float * q, const int ldq, float * z, const int ldz, int * m, float * pl, float * pr, float * dif, float * work, const int lwork, int * iwork, const int liwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_ijob=ijob, F77_n=n, F77_lda=lda, F77_ldb=ldb, F77_ldq=ldq, F77_ldz=ldz, F77_lwork=lwork, F77_liwork=liwork;
	int i_local;
	F77_INT F77_m[1];
	#define F77_iwork iwork
	F77_INT F77_info[1];
#else
	#define F77_ijob ijob
	#define F77_n n
	#define F77_lda lda
	#define F77_ldb ldb
	#define F77_ldq ldq
	#define F77_ldz ldz
	#define F77_m m
	#define F77_lwork lwork
	#define F77_iwork iwork
	#define F77_liwork liwork
	#define F77_info info
#endif

#ifdef F77_LOG
	F77_LOG F77_wantq=wantq, F77_wantz=wantz;
	int j_local;
	F77_LOG F77_select[n*1];
	for(j_local=0;j_local<n*1;j_local++) {
		F77_select[j_local]=(F77_LOG) select[j_local];
	}
#else
	#define F77_wantq wantq
	#define F77_wantz wantz
	#define F77_select select
#endif

	f77_stgsen(&F77_ijob, &F77_wantq, &F77_wantz, F77_select, &F77_n, a, &F77_lda, b, &F77_ldb, alphar, alphai, beta, q, &F77_ldq, z, &F77_ldz, F77_m, pl, pr, dif, work, &F77_lwork, F77_iwork, &F77_liwork, F77_info);

#ifdef F77_INT
	m[0]=(int) F77_m[0];
	info[0]=(int) F77_info[0];
#endif

#ifdef F77_LOG
#endif

}
