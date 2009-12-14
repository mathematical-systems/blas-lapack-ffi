#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fchecon_(char* uplo, int* n, void* a, int* lda, int* ipiv, float* anorm, float* rcond, void* work, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_checon(uploC, *n, a, *lda, ipiv, *anorm, rcond, work, info);
}
