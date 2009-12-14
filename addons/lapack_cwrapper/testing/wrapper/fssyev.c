#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fssyev_(char* jobz, char* uplo, int* n, float* a, int* lda, float* w, float* work, int* lwork, int* info)
{
	enum lapack_compute_vectors_type jobzC;
	if (*jobz=='N') jobzC = lapack_no_compute_vectors;
	else if(*jobz=='V') jobzC = lapack_compute_vectors;
	else jobzC = 0;
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_ssyev(jobzC, uploC, *n, a, *lda, w, work, *lwork, info);
}
