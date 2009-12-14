#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlatrd_(char* uplo, int* n, int* nb, void* a, int* lda, double* e, void* tau, void* w, int* ldw)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zlatrd(uploC, *n, *nb, a, *lda, e, tau, w, *ldw);
}
