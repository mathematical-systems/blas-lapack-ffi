#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcsyrfs_(char* uplo, int* n, int* nrhs, void* a, int* lda, void* af, int* ldaf, int* ipiv, void* b, int* ldb, void* x, int* ldx, float* ferr, float* berr, void* work, float* rwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_csyrfs(uploC, *n, *nrhs, a, *lda, af, *ldaf, ipiv, b, *ldb, x, *ldx, ferr, berr, work, rwork, info);
}
