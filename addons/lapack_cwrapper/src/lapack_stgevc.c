/*
 * lapack_stgevc.c
 *
 *This program is a C interface to stgevc.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_stgevc(const enum lapack_eigenvectors_side_type side, const enum lapack_how_many_type howmny, const long int * select, const int n, const float * s, const int lds, const float * p, const int ldp, float * vl, const int ldvl, float * vr, const int ldvr, const int mm, int * m, float * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lds=lds, F77_ldp=ldp, F77_ldvl=ldvl, F77_ldvr=ldvr, F77_mm=mm;
	int i_local;
	F77_INT F77_m[1];
	F77_m[0]=(F77_INT) m[0];
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_lds lds
	#define F77_ldp ldp
	#define F77_ldvl ldvl
	#define F77_ldvr ldvr
	#define F77_mm mm
	#define F77_m m
	#define F77_info info
#endif

#ifdef F77_LOG
;
	int j_local;
	F77_LOG F77_select[n*1];
	for(j_local=0;j_local<n*1;j_local++) {
		F77_select[j_local]=(F77_LOG) select[j_local];
	}
#else
	#define F77_select select
#endif

#ifdef F77_CHAR
	F77_CHAR F77_side, F77_howmny;
#else
	#define F77_side C_side
	#define F77_howmny C_howmny
#endif

	char C_side=' ';
	if (side == lapack_left_eigenvectors) {
		 C_side = 'L';
	} else if (side == lapack_right_eigenvectors) {
		 C_side = 'R';
	} else if (side == lapack_both_eigenvectors) {
		 C_side = 'B';
	}

	char C_howmny=' ';
	if (howmny == lapack_all) {
		 C_howmny = 'A';
	} else if (howmny == lapack_backtransform) {
		 C_howmny = 'B';
	} else if (howmny == lapack_select) {
		 C_howmny = 'S';
	}

#ifdef F77_CHAR
	F77_side = C2F_CHAR(&C_side)
	F77_howmny = C2F_CHAR(&C_howmny)
#endif

	f77_stgevc(&F77_side, &F77_howmny, F77_select, &F77_n, s, &F77_lds, p, &F77_ldp, vl, &F77_ldvl, vr, &F77_ldvr, &F77_mm, F77_m, work, F77_info);

#ifdef F77_INT
	m[0]=(int) F77_m[0];
	info[0]=(int) F77_info[0];
#endif

#ifdef F77_LOG
#endif

}
