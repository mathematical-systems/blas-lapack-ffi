#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgeesx_(char* jobvs, char* sort, const long int (*select) (float*,float*), char* sense, int* n, float* a, int* lda, int* sdim, float* wr, float* wi, float* vs, int* ldvs, float* rconde, float* rcondv, float* work, int* lwork, int* iwork, int* liwork, long int* bwork, int* info)
{
	enum lapack_compute_vectors_type jobvsC;
	if (*jobvs=='N') jobvsC = lapack_no_compute_vectors;
	else if(*jobvs=='V') jobvsC = lapack_compute_vectors;
	else jobvsC = 0;
	enum lapack_ordering_type sortC;
	if (*sort=='S') sortC = lapack_do_order;
	else if(*sort=='N') sortC = lapack_not_order;
	else sortC = 0;
	enum lapack_reciprocal_condition_type senseC;
	if (*sense=='N') senseC = lapack_no_reciprocal;
	else if(*sense=='E') senseC = lapack_average_selected;
	else if(*sense=='V') senseC = lapack_selected_right_subspace;
	else if(*sense=='B') senseC = lapack_both_reciprocal;
	else senseC = 0;
	lapack_sgeesx(jobvsC, sortC, select, senseC, *n, a, *lda, sdim, wr, wi, vs, *ldvs, rconde, rcondv, work, *lwork, iwork, *liwork, bwork, info);
}
