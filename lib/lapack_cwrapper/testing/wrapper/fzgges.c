#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgges_(char* jobvsl, char* jobvsr, char* sort, const long int (*selctg) (void*,void*), int* n, void* a, int* lda, void* b, int* ldb, int* sdim, void* alpha, void* beta, void* vsl, int* ldvsl, void* vsr, int* ldvsr, void* work, int* lwork, double* rwork, long int* bwork, int* info)
{
	enum lapack_compute_vectors_type jobvslC;
	if (*jobvsl=='N') jobvslC = lapack_no_compute_vectors;
	else if(*jobvsl=='V') jobvslC = lapack_compute_vectors;
	else jobvslC = 0;
	enum lapack_compute_vectors_type jobvsrC;
	if (*jobvsr=='N') jobvsrC = lapack_no_compute_vectors;
	else if(*jobvsr=='V') jobvsrC = lapack_compute_vectors;
	else jobvsrC = 0;
	enum lapack_ordering_type sortC;
	if (*sort=='S') sortC = lapack_do_order;
	else if(*sort=='N') sortC = lapack_not_order;
	else sortC = 0;
	lapack_zgges(jobvslC, jobvsrC, sortC, selctg, *n, a, *lda, b, *ldb, sdim, alpha, beta, vsl, *ldvsl, vsr, *ldvsr, work, *lwork, rwork, bwork, info);
}
