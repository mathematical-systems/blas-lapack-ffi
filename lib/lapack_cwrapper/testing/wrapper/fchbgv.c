#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fchbgv_(char* jobz, char* uplo, int* n, int* ka, int* kb, void* ab, int* ldab, void* bb, int* ldbb, float* w, void* z, int* ldz, void* work, float* rwork, int* info)
{
	enum lapack_compute_vectors_type jobzC;
	if (*jobz=='N') jobzC = lapack_no_compute_vectors;
	else if(*jobz=='V') jobzC = lapack_compute_vectors;
	else jobzC = 0;
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_chbgv(jobzC, uploC, *n, *ka, *kb, ab, *ldab, bb, *ldbb, w, z, *ldz, work, rwork, info);
}
