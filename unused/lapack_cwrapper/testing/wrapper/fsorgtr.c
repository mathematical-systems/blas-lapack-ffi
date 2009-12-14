#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsorgtr_(char* uplo, int* n, float* a, int* lda, float* tau, float* work, int* lwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_sorgtr(uploC, *n, a, *lda, tau, work, *lwork, info);
}
