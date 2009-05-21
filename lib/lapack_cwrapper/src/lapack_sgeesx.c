/*
 * lapack_sgeesx.c
 *
 *This program is a C interface to sgeesx.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_sgeesx(const enum lapack_compute_vectors_type jobvs, const enum lapack_ordering_type sort, const long int (*select) (float*,float*), const enum lapack_reciprocal_condition_type sense, const int n, float * a, const int lda, int * sdim, float * wr, float * wi, float * vs, const int ldvs, float * rconde, float * rcondv, float * work, const int lwork, int * iwork, const int liwork, long int * bwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lda=lda, F77_ldvs=ldvs, F77_lwork=lwork, F77_liwork=liwork;
	int i_local;
	F77_INT F77_sdim[1];
	#define F77_iwork iwork
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_lda lda
	#define F77_sdim sdim
	#define F77_ldvs ldvs
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
	F77_CHAR F77_jobvs, F77_sort, F77_sense;
#else
	#define F77_jobvs C_jobvs
	#define F77_sort C_sort
	#define F77_sense C_sense
#endif

	char C_jobvs=' ';
	if (jobvs == lapack_no_compute_vectors) {
		 C_jobvs = 'N';
	} else if (jobvs == lapack_compute_vectors) {
		 C_jobvs = 'V';
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
	F77_jobvs = C2F_CHAR(&C_jobvs)
	F77_sort = C2F_CHAR(&C_sort)
	F77_sense = C2F_CHAR(&C_sense)
#endif

	f77_sgeesx(&F77_jobvs, &F77_sort, select, &F77_sense, &F77_n, a, &F77_lda, F77_sdim, wr, wi, vs, &F77_ldvs, rconde, rcondv, work, &F77_lwork, F77_iwork, &F77_liwork, F77_bwork, F77_info);

#ifdef F77_INT
	sdim[0]=(int) F77_sdim[0];
	info[0]=(int) F77_info[0];
#endif

#ifdef F77_LOG
#endif

}
