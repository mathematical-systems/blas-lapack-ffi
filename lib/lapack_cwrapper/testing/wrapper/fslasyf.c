#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasyf_(char* uplo, int* n, int* nb, int* kb, float* a, int* lda, int* ipiv, float* w, int* ldw, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_slasyf(uploC, *n, *nb, kb, a, *lda, ipiv, w, *ldw, info);
}
