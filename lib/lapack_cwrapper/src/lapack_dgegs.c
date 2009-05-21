/*
 * lapack_dgegs.c
 *
 *This program is a C interface to dgegs.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dgegs(const enum lapack_compute_vectors_type jobvsl, const enum lapack_compute_vectors_type jobvsr, const int n, double * a, const int lda, double * b, const int ldb, double * alphar, double * alphai, double * beta, double * vsl, const int ldvsl, double * vsr, const int ldvsr, double * work, const int lwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lda=lda, F77_ldb=ldb, F77_ldvsl=ldvsl, F77_ldvsr=ldvsr, F77_lwork=lwork;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_lda lda
	#define F77_ldb ldb
	#define F77_ldvsl ldvsl
	#define F77_ldvsr ldvsr
	#define F77_lwork lwork
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_jobvsl, F77_jobvsr;
#else
	#define F77_jobvsl C_jobvsl
	#define F77_jobvsr C_jobvsr
#endif

	char C_jobvsl=' ';
	if (jobvsl == lapack_no_compute_vectors) {
		 C_jobvsl = 'N';
	} else if (jobvsl == lapack_compute_vectors) {
		 C_jobvsl = 'V';
	}

	char C_jobvsr=' ';
	if (jobvsr == lapack_no_compute_vectors) {
		 C_jobvsr = 'N';
	} else if (jobvsr == lapack_compute_vectors) {
		 C_jobvsr = 'V';
	}

#ifdef F77_CHAR
	F77_jobvsl = C2F_CHAR(&C_jobvsl)
	F77_jobvsr = C2F_CHAR(&C_jobvsr)
#endif

	f77_dgegs(&F77_jobvsl, &F77_jobvsr, &F77_n, a, &F77_lda, b, &F77_ldb, alphar, alphai, beta, vsl, &F77_ldvsl, vsr, &F77_ldvsr, work, &F77_lwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
