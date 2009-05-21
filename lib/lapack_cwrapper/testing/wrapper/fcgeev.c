#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgeev_(char* jobvl, char* jobvr, int* n, void* a, int* lda, void* w, void* vl, int* ldvl, void* vr, int* ldvr, void* work, int* lwork, float* rwork, int* info)
{
	enum lapack_compute_vectors_type jobvlC;
	if (*jobvl=='N') jobvlC = lapack_no_compute_vectors;
	else if(*jobvl=='V') jobvlC = lapack_compute_vectors;
	else jobvlC = 0;
	enum lapack_compute_vectors_type jobvrC;
	if (*jobvr=='N') jobvrC = lapack_no_compute_vectors;
	else if(*jobvr=='V') jobvrC = lapack_compute_vectors;
	else jobvrC = 0;
	lapack_cgeev(jobvlC, jobvrC, *n, a, *lda, w, vl, *ldvl, vr, *ldvr, work, *lwork, rwork, info);
}
