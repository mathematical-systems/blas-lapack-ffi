#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzhegs2_(int* itype, char* uplo, int* n, void* a, int* lda, void* b, int* ldb, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zhegs2(*itype, uploC, *n, a, *lda, b, *ldb, info);
}
