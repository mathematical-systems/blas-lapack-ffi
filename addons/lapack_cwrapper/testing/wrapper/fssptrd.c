#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fssptrd_(char* uplo, int* n, float* ap, float* d, float* e, float* tau, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_ssptrd(uploC, *n, ap, d, e, tau, info);
}
