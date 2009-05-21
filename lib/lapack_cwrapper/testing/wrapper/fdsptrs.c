#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdsptrs_(char* uplo, int* n, int* nrhs, double* ap, int* ipiv, double* b, int* ldb, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dsptrs(uploC, *n, *nrhs, ap, ipiv, b, *ldb, info);
}
