/*
 * lapack_slasd2.c
 *
 *This program is a C interface to slasd2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slasd2(const int nl, const int nr, const int sqre, int * k, float * d, float * z, const float alpha, const float beta, float * u, const int ldu, float * vt, const int ldvt, float * dsigma, float * u2, const int ldu2, float * vt2, const int ldvt2, int * idxp, int * idx, int * idxc, int * idxq, int * coltyp, int * info )
{
#ifdef F77_INT
	F77_INT F77_nl=nl, F77_nr=nr, F77_sqre=sqre, F77_ldu=ldu, F77_ldu2=ldu2, F77_ldvt=ldvt, F77_ldvt2=ldvt2;
	int i_local;
	F77_INT F77_k[1];
	F77_k[0]=(F77_INT) k[0];
	F77_INT F77_idxp[(nl+nr+1)*1];
	for(i_local=0;i_local<(nl+nr+1)*1;i_local++) {
		F77_idxp[i_local]=(F77_INT) idxp[i_local];
	}
	F77_INT F77_idx[(nl+nr+1)*1];
	for(i_local=0;i_local<(nl+nr+1)*1;i_local++) {
		F77_idx[i_local]=(F77_INT) idx[i_local];
	}
	F77_INT F77_idxc[(nl+nr+1)*1];
	for(i_local=0;i_local<(nl+nr+1)*1;i_local++) {
		F77_idxc[i_local]=(F77_INT) idxc[i_local];
	}
	F77_INT F77_coltyp[(nl+nr+1)*1];
	for(i_local=0;i_local<(nl+nr+1)*1;i_local++) {
		F77_coltyp[i_local]=(F77_INT) coltyp[i_local];
	}
	F77_INT F77_idxq[(nl+nr+1)*1];
	for(i_local=0;i_local<(nl+nr+1)*1;i_local++) {
		F77_idxq[i_local]=(F77_INT) idxq[i_local];
	}
	F77_INT F77_info[1];
	F77_info[0]=(F77_INT) info[0];
#else
	#define F77_nl nl
	#define F77_nr nr
	#define F77_sqre sqre
	#define F77_k k
	#define F77_ldu ldu
	#define F77_ldu2 ldu2
	#define F77_ldvt ldvt
	#define F77_ldvt2 ldvt2
	#define F77_idxp idxp
	#define F77_idx idx
	#define F77_idxc idxc
	#define F77_coltyp coltyp
	#define F77_idxq idxq
	#define F77_info info
#endif

	f77_slasd2(&F77_nl, &F77_nr, &F77_sqre, F77_k, d, z, &alpha, &beta, u, &F77_ldu, vt, &F77_ldvt, dsigma, u2, &F77_ldu2, vt2, &F77_ldvt2, F77_idxp, F77_idx, F77_idxc, F77_idxq, F77_coltyp, F77_info);

#ifdef F77_INT
	k[0]=(int) F77_k[0];

	for(i_local=0;i_local<(nl+nr+1)*1;i_local++) {
		idxp[i_local]=(int) F77_idxp[i_local];
	}

	for(i_local=0;i_local<(nl+nr+1)*1;i_local++) {
		idx[i_local]=(int) F77_idx[i_local];
	}

	for(i_local=0;i_local<(nl+nr+1)*1;i_local++) {
		idxc[i_local]=(int) F77_idxc[i_local];
	}

	for(i_local=0;i_local<(nl+nr+1)*1;i_local++) {
		coltyp[i_local]=(int) F77_coltyp[i_local];
	}

	for(i_local=0;i_local<(nl+nr+1)*1;i_local++) {
		idxq[i_local]=(int) F77_idxq[i_local];
	}

	info[0]=(int) F77_info[0];

#endif

}
