#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclalsd_(char* uplo, int* smlsiz, int* n, int* nrhs, float* d, float* e, void* b, int* ldb, float* rcond, int* rank, void* work, float* rwork, int* iwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_clalsd(uploC, *smlsiz, *n, *nrhs, d, e, b, *ldb, *rcond, rank, work, rwork, iwork, info);
}
