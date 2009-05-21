#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fssptrf_(char* uplo, int* n, float* ap, int* ipiv, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_ssptrf(uploC, *n, ap, ipiv, info);
}
