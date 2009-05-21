#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlalsd_(char* uplo, int* smlsiz, int* n, int* nrhs, double* d, double* e, void* b, int* ldb, double* rcond, int* rank, void* work, double* rwork, int* iwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zlalsd(uploC, *smlsiz, *n, *nrhs, d, e, b, *ldb, *rcond, rank, work, rwork, iwork, info);
}
