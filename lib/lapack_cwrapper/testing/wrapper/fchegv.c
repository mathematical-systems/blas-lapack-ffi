#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fchegv_(int* itype, char* jobz, char* uplo, int* n, void* a, int* lda, void* b, int* ldb, float* w, void* work, int* lwork, float* rwork, int* info)
{
	enum lapack_compute_vectors_type jobzC;
	if (*jobz=='N') jobzC = lapack_no_compute_vectors;
	else if(*jobz=='V') jobzC = lapack_compute_vectors;
	else jobzC = 0;
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_chegv(*itype, jobzC, uploC, *n, a, *lda, b, *ldb, w, work, *lwork, rwork, info);
}
