#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdposv_(char* uplo, int* n, int* nrhs, double* a, int* lda, double* b, int* ldb, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dposv(uploC, *n, *nrhs, a, *lda, b, *ldb, info);
}
