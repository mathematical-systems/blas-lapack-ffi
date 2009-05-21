/*
 * lapack_ztgexc.c
 *
 *This program is a C interface to ztgexc.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_ztgexc(const long int wantq, const long int wantz, const int n, void * a, const int lda, void * b, const int ldb, void * q, const int ldq, void * z, const int ldz, const int ifst, int * ilst, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lda=lda, F77_ldb=ldb, F77_ldq=ldq, F77_ldz=ldz, F77_ifst=ifst;
	int i_local;
	F77_INT F77_ilst[1];
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_lda lda
	#define F77_ldb ldb
	#define F77_ldq ldq
	#define F77_ldz ldz
	#define F77_ifst ifst
	#define F77_ilst ilst
	#define F77_info info
#endif

#ifdef F77_LOG
	F77_LOG F77_wantq=wantq, F77_wantz=wantz;
#else
	#define F77_wantq wantq
	#define F77_wantz wantz
#endif

	f77_ztgexc(&F77_wantq, &F77_wantz, &F77_n, a, &F77_lda, b, &F77_ldb, q, &F77_ldq, z, &F77_ldz, &F77_ifst, F77_ilst, F77_info);

#ifdef F77_INT
	ilst[0]=(int) F77_ilst[0];
	info[0]=(int) F77_info[0];
#endif

#ifdef F77_LOG
#endif

}
