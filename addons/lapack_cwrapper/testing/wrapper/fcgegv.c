#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgegv_(char* jobvl, char* jobvr, int* n, void* a, int* lda, void* b, int* ldb, void* alpha, void* beta, void* vl, int* ldvl, void* vr, int* ldvr, void* work, int* lwork, float* rwork, int* info)
{
	enum lapack_compute_vectors_type jobvlC;
	if (*jobvl=='N') jobvlC = lapack_no_compute_vectors;
	else if(*jobvl=='V') jobvlC = lapack_compute_vectors;
	else jobvlC = 0;
	enum lapack_compute_vectors_type jobvrC;
	if (*jobvr=='N') jobvrC = lapack_no_compute_vectors;
	else if(*jobvr=='V') jobvrC = lapack_compute_vectors;
	else jobvrC = 0;
	lapack_cgegv(jobvlC, jobvrC, *n, a, *lda, b, *ldb, alpha, beta, vl, *ldvl, vr, *ldvr, work, *lwork, rwork, info);
}
