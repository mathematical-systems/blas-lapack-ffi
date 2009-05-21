#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdstevd_(char* jobz, int* n, double* d, double* e, double* z, int* ldz, double* work, int* lwork, int* iwork, int* liwork, int* info)
{
	enum lapack_compute_vectors_type jobzC;
	if (*jobz=='N') jobzC = lapack_no_compute_vectors;
	else if(*jobz=='V') jobzC = lapack_compute_vectors;
	else jobzC = 0;
	lapack_dstevd(jobzC, *n, d, e, z, *ldz, work, *lwork, iwork, *liwork, info);
}
