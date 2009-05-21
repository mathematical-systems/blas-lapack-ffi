#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgees_(char* jobvs, char* sort, const long int (*select) (float*,float*), int* n, float* a, int* lda, int* sdim, float* wr, float* wi, float* vs, int* ldvs, float* work, int* lwork, long int* bwork, int* info)
{
	enum lapack_compute_vectors_type jobvsC;
	if (*jobvs=='N') jobvsC = lapack_no_compute_vectors;
	else if(*jobvs=='V') jobvsC = lapack_compute_vectors;
	else jobvsC = 0;
	enum lapack_ordering_type sortC;
	if (*sort=='S') sortC = lapack_do_order;
	else if(*sort=='N') sortC = lapack_not_order;
	else sortC = 0;
	lapack_sgees(jobvsC, sortC, select, *n, a, *lda, sdim, wr, wi, vs, *ldvs, work, *lwork, bwork, info);
}
