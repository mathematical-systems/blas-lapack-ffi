/*
 * lapack_zhsein.c
 *
 *This program is a C interface to zhsein.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zhsein(const enum lapack_side_type side, const enum lapack_eig_source_type eigsrc, const enum lapack_init_vector_type initv, const long int * select, const int n, const void * h, const int ldh, void * w, void * vl, const int ldvl, void * vr, const int ldvr, const int mm, int * m, void * work, double * rwork, int * ifaill, int * ifailr, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ldh=ldh, F77_ldvl=ldvl, F77_ldvr=ldvr, F77_mm=mm;
	int i_local;
	F77_INT F77_m[1];
	F77_m[0]=(F77_INT) m[0];
	F77_INT F77_ifaill[mm*1];
	for(i_local=0;i_local<mm*1;i_local++) {
		F77_ifaill[i_local]=(F77_INT) ifaill[i_local];
	}
	F77_INT F77_ifailr[mm*1];
	for(i_local=0;i_local<mm*1;i_local++) {
		F77_ifailr[i_local]=(F77_INT) ifailr[i_local];
	}
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ldh ldh
	#define F77_ldvl ldvl
	#define F77_ldvr ldvr
	#define F77_mm mm
	#define F77_m m
	#define F77_ifaill ifaill
	#define F77_ifailr ifailr
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
	F77_CHAR F77_side, F77_eigsrc, F77_initv;
#else
	#define F77_side C_side
	#define F77_eigsrc C_eigsrc
	#define F77_initv C_initv
#endif

	char C_side=' ';
	if (side == lapack_left_side) {
		 C_side = 'L';
	} else if (side == lapack_right_side) {
		 C_side = 'R';
	}

	char C_eigsrc=' ';
	if (eigsrc == lapack_source_chseqr) {
		 C_eigsrc = 'Q';
	} else if (eigsrc == lapack_no_source) {
		 C_eigsrc = 'N';
	}

	char C_initv=' ';
	if (initv == lapack_no_vectors) {
		 C_initv = 'N';
	} else if (initv == lapack_user_vectors) {
		 C_initv = 'U';
	}

#ifdef F77_CHAR
	F77_side = C2F_CHAR(&C_side)
	F77_eigsrc = C2F_CHAR(&C_eigsrc)
	F77_initv = C2F_CHAR(&C_initv)
#endif

	f77_zhsein(&F77_side, &F77_eigsrc, &F77_initv, F77_select, &F77_n, h, &F77_ldh, w, vl, &F77_ldvl, vr, &F77_ldvr, &F77_mm, F77_m, work, rwork, F77_ifaill, F77_ifailr, F77_info);

#ifdef F77_INT
	m[0]=(int) F77_m[0];
	for(i_local=0;i_local<mm*1;i_local++) {
		ifaill[i_local]=(int) F77_ifaill[i_local];
	}

	for(i_local=0;i_local<mm*1;i_local++) {
		ifailr[i_local]=(int) F77_ifailr[i_local];
	}

	info[0]=(int) F77_info[0];
#endif

#ifdef F77_LOG
#endif

}
