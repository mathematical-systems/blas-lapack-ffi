#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fssbevd_(char* jobz, char* uplo, int* n, int* kd, float* ab, int* ldab, float* w, float* z, int* ldz, float* work, int* lwork, int* iwork, int* liwork, int* info)
{
	enum lapack_compute_vectors_type jobzC;
	if (*jobz=='N') jobzC = lapack_no_compute_vectors;
	else if(*jobz=='V') jobzC = lapack_compute_vectors;
	else jobzC = 0;
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_ssbevd(jobzC, uploC, *n, *kd, ab, *ldab, w, z, *ldz, work, *lwork, iwork, *liwork, info);
}
