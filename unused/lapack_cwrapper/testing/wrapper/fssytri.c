#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fssytri_(char* uplo, int* n, float* a, int* lda, int* ipiv, float* work, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_ssytri(uploC, *n, a, *lda, ipiv, work, info);
}
