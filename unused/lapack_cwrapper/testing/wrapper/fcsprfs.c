#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcsprfs_(char* uplo, int* n, int* nrhs, void* ap, void* afp, int* ipiv, void* b, int* ldb, void* x, int* ldx, float* ferr, float* berr, void* work, float* rwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_csprfs(uploC, *n, *nrhs, ap, afp, ipiv, b, *ldb, x, *ldx, ferr, berr, work, rwork, info);
}
