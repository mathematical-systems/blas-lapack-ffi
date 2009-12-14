#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsstev_(char* jobz, int* n, float* d, float* e, float* z, int* ldz, float* work, int* info)
{
	enum lapack_compute_vectors_type jobzC;
	if (*jobz=='N') jobzC = lapack_no_compute_vectors;
	else if(*jobz=='V') jobzC = lapack_compute_vectors;
	else jobzC = 0;
	lapack_sstev(jobzC, *n, d, e, z, *ldz, work, info);
}
