#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclasyf_(char* uplo, int* n, int* nb, int* kb, void* a, int* lda, int* ipiv, void* w, int* ldw, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_clasyf(uploC, *n, *nb, kb, a, *lda, ipiv, w, *ldw, info);
}
