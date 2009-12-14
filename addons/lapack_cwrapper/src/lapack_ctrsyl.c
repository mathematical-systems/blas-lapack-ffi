/*
 * lapack_ctrsyl.c
 *
 *This program is a C interface to ctrsyl.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_ctrsyl(const enum lapack_trans_type trana, const enum lapack_trans_type tranb, const int isgn, const int m, const int n, const void * a, const int lda, const void * b, const int ldb, void * c, const int ldc, float * scale, int * info )
{
#ifdef F77_INT
	F77_INT F77_isgn=isgn, F77_m=m, F77_n=n, F77_lda=lda, F77_ldb=ldb, F77_ldc=ldc;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_isgn isgn
	#define F77_m m
	#define F77_n n
	#define F77_lda lda
	#define F77_ldb ldb
	#define F77_ldc ldc
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_trana, F77_tranb;
#else
	#define F77_trana C_trana
	#define F77_tranb C_tranb
#endif

	char C_trana=' ';
	if (trana == lapack_no_trans) {
		 C_trana = 'N';
	} else if (trana == lapack_trans) {
		 C_trana = 'T';
	} else if (trana == lapack_conj_trans) {
		 C_trana = 'C';
	}

	char C_tranb=' ';
	if (tranb == lapack_no_trans) {
		 C_tranb = 'N';
	} else if (tranb == lapack_trans) {
		 C_tranb = 'T';
	} else if (tranb == lapack_conj_trans) {
		 C_tranb = 'C';
	}

#ifdef F77_CHAR
	F77_trana = C2F_CHAR(&C_trana)
	F77_tranb = C2F_CHAR(&C_tranb)
#endif

	f77_ctrsyl(&F77_trana, &F77_tranb, &F77_isgn, &F77_m, &F77_n, a, &F77_lda, b, &F77_ldb, c, &F77_ldc, scale, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
