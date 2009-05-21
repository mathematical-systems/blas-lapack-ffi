#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgees_(char* jobvs, char* sort, const long int (*select) (void*), int* n, void* a, int* lda, int* sdim, void* w, void* vs, int* ldvs, void* work, int* lwork, float* rwork, long int* bwork, int* info)
{
	enum lapack_compute_vectors_type jobvsC;
	if (*jobvs=='N') jobvsC = lapack_no_compute_vectors;
	else if(*jobvs=='V') jobvsC = lapack_compute_vectors;
	else jobvsC = 0;
	enum lapack_ordering_type sortC;
	if (*sort=='S') sortC = lapack_do_order;
	else if(*sort=='N') sortC = lapack_not_order;
	else sortC = 0;
	lapack_cgees(jobvsC, sortC, select, *n, a, *lda, sdim, w, vs, *ldvs, work, *lwork, rwork, bwork, info);
}
