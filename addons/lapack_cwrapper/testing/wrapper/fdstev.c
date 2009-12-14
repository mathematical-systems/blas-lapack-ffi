#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdstev_(char* jobz, int* n, double* d, double* e, double* z, int* ldz, double* work, int* info)
{
	enum lapack_compute_vectors_type jobzC;
	if (*jobz=='N') jobzC = lapack_no_compute_vectors;
	else if(*jobz=='V') jobzC = lapack_compute_vectors;
	else jobzC = 0;
	lapack_dstev(jobzC, *n, d, e, z, *ldz, work, info);
}
