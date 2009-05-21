#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsporfs_(char* uplo, int* n, int* nrhs, float* a, int* lda, float* af, int* ldaf, float* b, int* ldb, float* x, int* ldx, float* ferr, float* berr, float* work, int* iwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_sporfs(uploC, *n, *nrhs, a, *lda, af, *ldaf, b, *ldb, x, *ldx, ferr, berr, work, iwork, info);
}
