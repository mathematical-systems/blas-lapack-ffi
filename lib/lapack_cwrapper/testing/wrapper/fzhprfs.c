#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzhprfs_(char* uplo, int* n, int* nrhs, void* ap, void* afp, int* ipiv, void* b, int* ldb, void* x, int* ldx, double* ferr, double* berr, void* work, double* rwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zhprfs(uploC, *n, *nrhs, ap, afp, ipiv, b, *ldb, x, *ldx, ferr, berr, work, rwork, info);
}
