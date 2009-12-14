#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgegs_(char* jobvsl, char* jobvsr, int* n, void* a, int* lda, void* b, int* ldb, void* alpha, void* beta, void* vsl, int* ldvsl, void* vsr, int* ldvsr, void* work, int* lwork, float* rwork, int* info)
{
	enum lapack_compute_vectors_type jobvslC;
	if (*jobvsl=='N') jobvslC = lapack_no_compute_vectors;
	else if(*jobvsl=='V') jobvslC = lapack_compute_vectors;
	else jobvslC = 0;
	enum lapack_compute_vectors_type jobvsrC;
	if (*jobvsr=='N') jobvsrC = lapack_no_compute_vectors;
	else if(*jobvsr=='V') jobvsrC = lapack_compute_vectors;
	else jobvsrC = 0;
	lapack_cgegs(jobvslC, jobvsrC, *n, a, *lda, b, *ldb, alpha, beta, vsl, *ldvsl, vsr, *ldvsr, work, *lwork, rwork, info);
}
