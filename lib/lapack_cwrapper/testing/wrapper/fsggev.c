#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsggev_(char* jobvl, char* jobvr, int* n, float* a, int* lda, float* b, int* ldb, float* alphar, float* alphai, float* beta, float* vl, int* ldvl, float* vr, int* ldvr, float* work, int* lwork, int* info)
{
	enum lapack_compute_vectors_type jobvlC;
	if (*jobvl=='N') jobvlC = lapack_no_compute_vectors;
	else if(*jobvl=='V') jobvlC = lapack_compute_vectors;
	else jobvlC = 0;
	enum lapack_compute_vectors_type jobvrC;
	if (*jobvr=='N') jobvrC = lapack_no_compute_vectors;
	else if(*jobvr=='V') jobvrC = lapack_compute_vectors;
	else jobvrC = 0;
	lapack_sggev(jobvlC, jobvrC, *n, a, *lda, b, *ldb, alphar, alphai, beta, vl, *ldvl, vr, *ldvr, work, *lwork, info);
}
