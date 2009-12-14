#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgegs_(char* jobvsl, char* jobvsr, int* n, double* a, int* lda, double* b, int* ldb, double* alphar, double* alphai, double* beta, double* vsl, int* ldvsl, double* vsr, int* ldvsr, double* work, int* lwork, int* info)
{
	enum lapack_compute_vectors_type jobvslC;
	if (*jobvsl=='N') jobvslC = lapack_no_compute_vectors;
	else if(*jobvsl=='V') jobvslC = lapack_compute_vectors;
	else jobvslC = 0;
	enum lapack_compute_vectors_type jobvsrC;
	if (*jobvsr=='N') jobvsrC = lapack_no_compute_vectors;
	else if(*jobvsr=='V') jobvsrC = lapack_compute_vectors;
	else jobvsrC = 0;
	lapack_dgegs(jobvslC, jobvsrC, *n, a, *lda, b, *ldb, alphar, alphai, beta, vsl, *ldvsl, vsr, *ldvsr, work, *lwork, info);
}
