#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcspr_(char* uplo, int* n, void* alpha, void* x, int* incx, void* ap)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_cspr(uploC, *n, alpha, x, *incx, ap);
}
