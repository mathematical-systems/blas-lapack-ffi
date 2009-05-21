/*
 * lapack_ssyevr.c
 *
 *This program is a C interface to ssyevr.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_ssyevr(const enum lapack_compute_vectors_type jobz, const enum lapack_range_type range, const enum lapack_uplo_type uplo, const int n, float * a, const int lda, const float vl, const float vu, const int il, const int iu, const float abstol, int * m, float * w, float * z, const int ldz, int * isuppz, float * work, const int lwork, int * iwork, const int liwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lda=lda, F77_il=il, F77_iu=iu, F77_ldz=ldz, F77_lwork=lwork, F77_liwork=liwork;
	int i_local;
	F77_INT F77_m[1];
	F77_m[0]=(F77_INT) m[0];
	int m_local;
	if (range==lapack_order) m_local = iu-il+1;
	else m_local=n;
	F77_INT F77_isuppz[2*max(1,m_local)];
	for(i_local=0;i_local<2*max(1,m_local);i_local++) {
		F77_isuppz[i_local]=(F77_INT) isuppz[i_local];
	}
	#define F77_iwork iwork
	F77_INT F77_info[1];
	F77_info[0]=(F77_INT) info[0];
#else
	#define F77_n n
	#define F77_lda lda
	#define F77_il il
	#define F77_iu iu
	#define F77_m m
	#define F77_ldz ldz
	#define F77_isuppz isuppz
	#define F77_lwork lwork
	#define F77_iwork iwork
	#define F77_liwork liwork
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_jobz, F77_range, F77_uplo;
#else
	#define F77_jobz C_jobz
	#define F77_range C_range
	#define F77_uplo C_uplo
#endif

	char C_jobz=' ';
	if (jobz == lapack_no_compute_vectors) {
		 C_jobz = 'N';
	} else if (jobz == lapack_compute_vectors) {
		 C_jobz = 'V';
	}

	char C_range=' ';
	if (range == lapack_range_all) {
		 C_range = 'A';
	} else if (range == lapack_interval) {
		 C_range = 'V';
	} else if (range == lapack_order) {
		 C_range = 'I';
	}

	char C_uplo=' ';
	if (uplo == lapack_upper) {
		 C_uplo = 'U';
	} else if (uplo == lapack_lower) {
		 C_uplo = 'L';
	}

#ifdef F77_CHAR
	F77_jobz = C2F_CHAR(&C_jobz)
	F77_range = C2F_CHAR(&C_range)
	F77_uplo = C2F_CHAR(&C_uplo)
#endif

	f77_ssyevr(&F77_jobz, &F77_range, &F77_uplo, &F77_n, a, &F77_lda, &vl, &vu, &F77_il, &F77_iu, &abstol, F77_m, w, z, &F77_ldz, F77_isuppz, work, &F77_lwork, F77_iwork, &F77_liwork, F77_info);

#ifdef F77_INT
	m[0]=(int) F77_m[0];

	for(i_local=0;i_local<2*max(1,m_local);i_local++) {
		isuppz[i_local]=(int) F77_isuppz[i_local];
	}

	info[0]=(int) F77_info[0];

#endif

}
