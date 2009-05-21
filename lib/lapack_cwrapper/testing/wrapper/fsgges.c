#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgges_(char* jobvsl, char* jobvsr, char* sort, const long int (*selctg) (float*,float*,float*), int* n, float* a, int* lda, float* b, int* ldb, int* sdim, float* alphar, float* alphai, float* beta, float* vsl, int* ldvsl, float* vsr, int* ldvsr, float* work, int* lwork, long int* bwork, int* info)
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
	lapack_sgges(jobvslC, jobvsrC, sortC, selctg, *n, a, *lda, b, *ldb, sdim, alphar, alphai, beta, vsl, *ldvsl, vsr, *ldvsr, work, *lwork, bwork, info);
}
