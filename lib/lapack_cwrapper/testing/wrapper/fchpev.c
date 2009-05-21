#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fchpev_(char* jobz, char* uplo, int* n, void* ap, float* w, void* z, int* ldz, void* work, float* rwork, int* info)
{
	enum lapack_compute_vectors_type jobzC;
	if (*jobz=='N') jobzC = lapack_no_compute_vectors;
	else if(*jobz=='V') jobzC = lapack_compute_vectors;
	else jobzC = 0;
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_chpev(jobzC, uploC, *n, ap, w, z, *ldz, work, rwork, info);
}
