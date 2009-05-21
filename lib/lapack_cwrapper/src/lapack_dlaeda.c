/*
 * lapack_dlaeda.c
 *
 *This program is a C interface to dlaeda.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlaeda(const int n, const int tlvls, const int curlvl, const int curpbm, const int * prmptr, const int * perm, const int * givptr, const int * givcol, const double * givnum, const double * q, const int * qptr, double * z, double * ztemp, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_tlvls=tlvls, F77_curlvl=curlvl, F77_curpbm=curpbm;
	int i_local;
	F77_INT F77_prmptr[1*1];
	for(i_local=0;i_local<1*1;i_local++) {
		F77_prmptr[i_local]=(F77_INT) prmptr[i_local];
	}
	F77_INT F77_perm[1*1];
	for(i_local=0;i_local<1*1;i_local++) {
		F77_perm[i_local]=(F77_INT) perm[i_local];
	}
	F77_INT F77_givptr[1*1];
	for(i_local=0;i_local<1*1;i_local++) {
		F77_givptr[i_local]=(F77_INT) givptr[i_local];
	}
	F77_INT F77_givcol[1*1];
	for(i_local=0;i_local<1*1;i_local++) {
		F77_givcol[i_local]=(F77_INT) givcol[i_local];
	}
	F77_INT F77_qptr[n+2*1];
	for(i_local=0;i_local<n+2*1;i_local++) {
		F77_qptr[i_local]=(F77_INT) qptr[i_local];
	}
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_tlvls tlvls
	#define F77_curlvl curlvl
	#define F77_curpbm curpbm
	#define F77_prmptr prmptr
	#define F77_perm perm
	#define F77_givptr givptr
	#define F77_givcol givcol
	#define F77_qptr qptr
	#define F77_info info
#endif

	f77_dlaeda(&F77_n, &F77_tlvls, &F77_curlvl, &F77_curpbm, F77_prmptr, F77_perm, F77_givptr, F77_givcol, givnum, q, F77_qptr, z, ztemp, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
