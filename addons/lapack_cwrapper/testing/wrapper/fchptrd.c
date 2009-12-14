#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fchptrd_(char* uplo, int* n, void* ap, float* d, float* e, void* tau, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_chptrd(uploC, *n, ap, d, e, tau, info);
}
