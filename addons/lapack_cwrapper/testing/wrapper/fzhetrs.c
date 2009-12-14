#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzhetrs_(char* uplo, int* n, int* nrhs, void* a, int* lda, int* ipiv, void* b, int* ldb, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zhetrs(uploC, *n, *nrhs, a, *lda, ipiv, b, *ldb, info);
}
