#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdsygst_(int* itype, char* uplo, int* n, double* a, int* lda, double* b, int* ldb, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dsygst(*itype, uploC, *n, a, *lda, b, *ldb, info);
}
