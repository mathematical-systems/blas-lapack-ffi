#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fssygst_(int* itype, char* uplo, int* n, float* a, int* lda, float* b, int* ldb, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_ssygst(*itype, uploC, *n, a, *lda, b, *ldb, info);
}
