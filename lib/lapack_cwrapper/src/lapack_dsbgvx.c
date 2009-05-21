/*
 * lapack_dsbgvx.c
 *
 *This program is a C interface to dsbgvx.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dsbgvx(const enum lapack_compute_vectors_type jobz, const enum lapack_range_type range, const enum lapack_uplo_type uplo, const int n, const int ka, const int kb, double * ab, const int ldab, double * bb, const int ldbb, double * q, const int ldq, const double vl, const double vu, const int il, const int iu, const double abstol, int * m, double * w, double * z, const int ldz, double * work, int * iwork, int * ifail, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ka=ka, F77_kb=kb, F77_ldab=ldab, F77_ldbb=ldbb, F77_ldq=ldq, F77_il=il, F77_iu=iu, F77_ldz=ldz;
	int i_local;
	F77_INT F77_m[1];
	F77_m[0]=(F77_INT) m[0];
	#define F77_iwork iwork
    int m_local;
    if (range==lapack_order) m_local = iu-il+1;
	else m_local=n;			
	F77_INT F77_ifail[m_local*1];
	for(i_local=0;i_local<m_local*1;i_local++) {
		F77_ifail[i_local]=(F77_INT) ifail[i_local];
	}
	F77_INT F77_info[1];
	F77_info[0]=(F77_INT) info[0];
#else
	#define F77_n n
	#define F77_ka ka
	#define F77_kb kb
	#define F77_ldab ldab
	#define F77_ldbb ldbb
	#define F77_ldq ldq
	#define F77_il il
	#define F77_iu iu
	#define F77_m m
	#define F77_ldz ldz
	#define F77_iwork iwork
	#define F77_ifail ifail
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

	f77_dsbgvx(&F77_jobz, &F77_range, &F77_uplo, &F77_n, &F77_ka, &F77_kb, ab, &F77_ldab, bb, &F77_ldbb, q, &F77_ldq, &vl, &vu, &F77_il, &F77_iu, &abstol, F77_m, w, z, &F77_ldz, work, F77_iwork, F77_ifail, F77_info);

#ifdef F77_INT
	m[0]=(int) F77_m[0];

	for(i_local=0;i_local<m[0]*1;i_local++) {
		ifail[i_local]=(int) F77_ifail[i_local];
	}

	info[0]=(int) F77_info[0];

#endif

}
