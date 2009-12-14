#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzsyr_(char* uplo, int* n, void* alpha, void* x, int* incx, void* a, int* lda)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zsyr(uploC, *n, alpha, x, *incx, a, *lda);
}
