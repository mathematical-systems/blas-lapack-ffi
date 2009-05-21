#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdsptrd_(char* uplo, int* n, double* ap, double* d, double* e, double* tau, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dsptrd(uploC, *n, ap, d, e, tau, info);
}
