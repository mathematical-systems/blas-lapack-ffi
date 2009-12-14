#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgegs_(char* jobvsl, char* jobvsr, int* n, float* a, int* lda, float* b, int* ldb, float* alphar, float* alphai, float* beta, float* vsl, int* ldvsl, float* vsr, int* ldvsr, float* work, int* lwork, int* info)
{
	enum lapack_compute_vectors_type jobvslC;
	if (*jobvsl=='N') jobvslC = lapack_no_compute_vectors;
	else if(*jobvsl=='V') jobvslC = lapack_compute_vectors;
	else jobvslC = 0;
	enum lapack_compute_vectors_type jobvsrC;
	if (*jobvsr=='N') jobvsrC = lapack_no_compute_vectors;
	else if(*jobvsr=='V') jobvsrC = lapack_compute_vectors;
	else jobvsrC = 0;
	lapack_sgegs(jobvslC, jobvsrC, *n, a, *lda, b, *ldb, alphar, alphai, beta, vsl, *ldvsl, vsr, *ldvsr, work, *lwork, info);
}
