#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcsymv_(char* uplo, int* n, void* alpha, void* a, int* lda, void* x, int* incx, void* beta, void* y, int* incy)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_csymv(uploC, *n, alpha, a, *lda, x, *incx, beta, y, *incy);
}
