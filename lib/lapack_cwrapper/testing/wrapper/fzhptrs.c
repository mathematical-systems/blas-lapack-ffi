#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzhptrs_(char* uplo, int* n, int* nrhs, void* ap, int* ipiv, void* b, int* ldb, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zhptrs(uploC, *n, *nrhs, ap, ipiv, b, *ldb, info);
}
