/*
 * lapack_dlasdt.c
 *
 *This program is a C interface to dlasdt.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlasdt(const int n, int * lvl, int * nd, int * inode, int * ndiml, int * ndimr, const int msub )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_msub=msub;
	int i_local;
	F77_INT F77_lvl[1];
	F77_INT F77_nd[1];
	F77_INT F77_inode[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_inode[i_local]=(F77_INT) inode[i_local];
	}
	F77_INT F77_ndiml[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_ndiml[i_local]=(F77_INT) ndiml[i_local];
	}
	F77_INT F77_ndimr[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_ndimr[i_local]=(F77_INT) ndimr[i_local];
	}
#else
	#define F77_n n
	#define F77_lvl lvl
	#define F77_nd nd
	#define F77_inode inode
	#define F77_ndiml ndiml
	#define F77_ndimr ndimr
	#define F77_msub msub
#endif

	f77_dlasdt(&F77_n, F77_lvl, F77_nd, F77_inode, F77_ndiml, F77_ndimr, &F77_msub);

#ifdef F77_INT
	lvl[0]=(int) F77_lvl[0];
	nd[0]=(int) F77_nd[0];
	for(i_local=0;i_local<n*1;i_local++) {
		inode[i_local]=(int) F77_inode[i_local];
	}

	for(i_local=0;i_local<n*1;i_local++) {
		ndiml[i_local]=(int) F77_ndiml[i_local];
	}

	for(i_local=0;i_local<n*1;i_local++) {
		ndimr[i_local]=(int) F77_ndimr[i_local];
	}

#endif

}
