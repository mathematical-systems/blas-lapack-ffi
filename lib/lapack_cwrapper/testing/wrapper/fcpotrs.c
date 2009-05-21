#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcpotrs_(char* uplo, int* n, int* nrhs, void* a, int* lda, void* b, int* ldb, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_cpotrs(uploC, *n, *nrhs, a, *lda, b, *ldb, info);
}
