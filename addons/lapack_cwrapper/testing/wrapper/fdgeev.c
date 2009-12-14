#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgeev_(char* jobvl, char* jobvr, int* n, double* a, int* lda, double* wr, double* wi, double* vl, int* ldvl, double* vr, int* ldvr, double* work, int* lwork, int* info)
{
	enum lapack_compute_vectors_type jobvlC;
	if (*jobvl=='N') jobvlC = lapack_no_compute_vectors;
	else if(*jobvl=='V') jobvlC = lapack_compute_vectors;
	else jobvlC = 0;
	enum lapack_compute_vectors_type jobvrC;
	if (*jobvr=='N') jobvrC = lapack_no_compute_vectors;
	else if(*jobvr=='V') jobvrC = lapack_compute_vectors;
	else jobvrC = 0;
	lapack_dgeev(jobvlC, jobvrC, *n, a, *lda, wr, wi, vl, *ldvl, vr, *ldvr, work, *lwork, info);
}
