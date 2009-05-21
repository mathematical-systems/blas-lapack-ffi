/*
 * lapack_sggesx.c
 *
 *This program is a C interface to sggesx.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_sggesx(const enum lapack_compute_vectors_type jobvsl, const enum lapack_compute_vectors_type jobvsr, const enum lapack_ordering_type sort, const long int (*selctg) (float*,float*,float*), const enum lapack_reciprocal_condition_type sense, const int n, float * a, const int lda, float * b, const int ldb, int * sdim, float * alphar, float * alphai, float * beta, float * vsl, const int ldvsl, float * vsr, const int ldvsr, float * rconde, float * rcondv, float * work, const int lwork, int * iwork, const int liwork, long int * bwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lda=lda, F77_ldb=ldb, F77_ldvsl=ldvsl, F77_ldvsr=ldvsr, F77_lwork=lwork, F77_liwork=liwork;
	int i_local;
	F77_INT F77_sdim[1];
	#define F77_iwork iwork
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_lda lda
	#define F77_ldb ldb
	#define F77_sdim sdim
	#define F77_ldvsl ldvsl
	#define F77_ldvsr ldvsr
	#define F77_lwork lwork
	#define F77_iwork iwork
	#define F77_liwork liwork
	#define F77_info info
#endif

#ifdef F77_LOG
;
	#define F77_bwork bwork
#else
	#define F77_bwork bwork
#endif

#ifdef F77_CHAR
	F77_CHAR F77_jobvsl, F77_jobvsr, F77_sort, F77_sense;
#else
	#define F77_jobvsl C_jobvsl
	#define F77_jobvsr C_jobvsr
	#define F77_sort C_sort
	#define F77_sense C_sense
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

	char C_sort=' ';
	if (sort == lapack_do_order) {
		 C_sort = 'S';
	} else if (sort == lapack_not_order) {
		 C_sort = 'N';
	}

	char C_sense=' ';
	if (sense == lapack_no_reciprocal) {
		 C_sense = 'N';
	} else if (sense == lapack_average_selected) {
		 C_sense = 'E';
	} else if (sense == lapack_selected_right_subspace) {
		 C_sense = 'V';
	} else if (sense == lapack_both_reciprocal) {
		 C_sense = 'B';
	}

#ifdef F77_CHAR
	F77_jobvsl = C2F_CHAR(&C_jobvsl)
	F77_jobvsr = C2F_CHAR(&C_jobvsr)
	F77_sort = C2F_CHAR(&C_sort)
	F77_sense = C2F_CHAR(&C_sense)
#endif

	f77_sggesx(&F77_jobvsl, &F77_jobvsr, &F77_sort, selctg, &F77_sense, &F77_n, a, &F77_lda, b, &F77_ldb, F77_sdim, alphar, alphai, beta, vsl, &F77_ldvsl, vsr, &F77_ldvsr, rconde, rcondv, work, &F77_lwork, F77_iwork, &F77_liwork, F77_bwork, F77_info);

#ifdef F77_INT
	sdim[0]=(int) F77_sdim[0];
	info[0]=(int) F77_info[0];
#endif

#ifdef F77_LOG
#endif

}
