#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdsbgvd_(char* jobz, char* uplo, int* n, int* ka, int* kb, double* ab, int* ldab, double* bb, int* ldbb, double* w, double* z, int* ldz, double* work, int* lwork, int* iwork, int* liwork, int* info)
{
	enum lapack_compute_vectors_type jobzC;
	if (*jobz=='N') jobzC = lapack_no_compute_vectors;
	else if(*jobz=='V') jobzC = lapack_compute_vectors;
	else jobzC = 0;
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dsbgvd(jobzC, uploC, *n, *ka, *kb, ab, *ldab, bb, *ldbb, w, z, *ldz, work, *lwork, iwork, *liwork, info);
}
