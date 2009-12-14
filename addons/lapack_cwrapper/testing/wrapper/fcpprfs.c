#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcpprfs_(char* uplo, int* n, int* nrhs, void* ap, void* afp, void* b, int* ldb, void* x, int* ldx, float* ferr, float* berr, void* work, float* rwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_cpprfs(uploC, *n, *nrhs, ap, afp, b, *ldb, x, *ldx, ferr, berr, work, rwork, info);
}
