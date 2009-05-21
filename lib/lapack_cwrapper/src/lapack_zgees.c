/*
 * lapack_zgees.c
 *
 *This program is a C interface to zgees.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zgees(const enum lapack_compute_vectors_type jobvs, const enum lapack_ordering_type sort, const long int (*select) (void*), const int n, void * a, const int lda, int * sdim, void * w, void * vs, const int ldvs, void * work, const int lwork, double * rwork, long int * bwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lda=lda, F77_ldvs=ldvs, F77_lwork=lwork;
	int i_local;
	F77_INT F77_sdim[1];
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_lda lda
	#define F77_sdim sdim
	#define F77_ldvs ldvs
	#define F77_lwork lwork
	#define F77_info info
#endif

#ifdef F77_LOG
;
	#define F77_bwork bwork
#else
	#define F77_bwork bwork
#endif

#ifdef F77_CHAR
	F77_CHAR F77_jobvs, F77_sort;
#else
	#define F77_jobvs C_jobvs
	#define F77_sort C_sort
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

#ifdef F77_CHAR
	F77_jobvs = C2F_CHAR(&C_jobvs)
	F77_sort = C2F_CHAR(&C_sort)
#endif

	f77_zgees(&F77_jobvs, &F77_sort, select, &F77_n, a, &F77_lda, F77_sdim, w, vs, &F77_ldvs, work, &F77_lwork, rwork, F77_bwork, F77_info);

#ifdef F77_INT
	sdim[0]=(int) F77_sdim[0];
	info[0]=(int) F77_info[0];
#endif

#ifdef F77_LOG
#endif

}
