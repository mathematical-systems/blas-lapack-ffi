#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fssysv_(char* uplo, int* n, int* nrhs, float* a, int* lda, int* ipiv, float* b, int* ldb, float* work, int* lwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_ssysv(uploC, *n, *nrhs, a, *lda, ipiv, b, *ldb, work, *lwork, info);
}
