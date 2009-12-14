#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgeev_(char* jobvl, char* jobvr, int* n, float* a, int* lda, float* wr, float* wi, float* vl, int* ldvl, float* vr, int* ldvr, float* work, int* lwork, int* info)
{
	enum lapack_compute_vectors_type jobvlC;
	if (*jobvl=='N') jobvlC = lapack_no_compute_vectors;
	else if(*jobvl=='V') jobvlC = lapack_compute_vectors;
	else jobvlC = 0;
	enum lapack_compute_vectors_type jobvrC;
	if (*jobvr=='N') jobvrC = lapack_no_compute_vectors;
	else if(*jobvr=='V') jobvrC = lapack_compute_vectors;
	else jobvrC = 0;
	lapack_sgeev(jobvlC, jobvrC, *n, a, *lda, wr, wi, vl, *ldvl, vr, *ldvr, work, *lwork, info);
}
