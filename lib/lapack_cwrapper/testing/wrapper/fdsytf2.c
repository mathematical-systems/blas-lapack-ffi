#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdsytf2_(char* uplo, int* n, double* a, int* lda, int* ipiv, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dsytf2(uploC, *n, a, *lda, ipiv, info);
}
