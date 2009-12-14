/*
 * lapack_sstebz.c
 *
 *This program is a C interface to sstebz.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_sstebz(const enum lapack_range_type range, const enum lapack_order_block_type order, const int n, const float vl, const float vu, const int il, const int iu, const float abstol, const float * d, const float * e, int * m, int * nsplit, float * w, int * iblock, int * isplit, float * work, int * iwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_il=il, F77_iu=iu;
	int i_local;
	F77_INT F77_m[1];
	F77_INT F77_nsplit[1];
	F77_INT F77_iblock[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_iblock[i_local]=(F77_INT) iblock[i_local];
	}
	F77_INT F77_isplit[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_isplit[i_local]=(F77_INT) isplit[i_local];
	}
	#define F77_iwork iwork
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_il il
	#define F77_iu iu
	#define F77_m m
	#define F77_nsplit nsplit
	#define F77_iblock iblock
	#define F77_isplit isplit
	#define F77_iwork iwork
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_range, F77_order;
#else
	#define F77_range C_range
	#define F77_order C_order
#endif

	char C_range=' ';
	if (range == lapack_range_all) {
		 C_range = 'A';
	} else if (range == lapack_interval) {
		 C_range = 'V';
	} else if (range == lapack_order) {
		 C_range = 'I';
	}

	char C_order=' ';
	if (order == lapack_by_block) {
		 C_order = 'B';
	} else if (order == lapack_matrix) {
		 C_order = 'E';
	}

#ifdef F77_CHAR
	F77_range = C2F_CHAR(&C_range)
	F77_order = C2F_CHAR(&C_order)
#endif

	f77_sstebz(&F77_range, &F77_order, &F77_n, &vl, &vu, &F77_il, &F77_iu, &abstol, d, e, F77_m, F77_nsplit, w, F77_iblock, F77_isplit, work, F77_iwork, F77_info);

#ifdef F77_INT
	m[0]=(int) F77_m[0];
	nsplit[0]=(int) F77_nsplit[0];
	for(i_local=0;i_local<n*1;i_local++) {
		iblock[i_local]=(int) F77_iblock[i_local];
	}

	for(i_local=0;i_local<n*1;i_local++) {
		isplit[i_local]=(int) F77_isplit[i_local];
	}

	info[0]=(int) F77_info[0];
#endif

}
