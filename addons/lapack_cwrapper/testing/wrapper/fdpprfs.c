#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdpprfs_(char* uplo, int* n, int* nrhs, double* ap, double* afp, double* b, int* ldb, double* x, int* ldx, double* ferr, double* berr, double* work, int* iwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dpprfs(uploC, *n, *nrhs, ap, afp, b, *ldb, x, *ldx, ferr, berr, work, iwork, info);
}
