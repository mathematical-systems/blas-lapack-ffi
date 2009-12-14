#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslatrd_(char* uplo, int* n, int* nb, float* a, int* lda, float* e, float* tau, float* w, int* ldw)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_slatrd(uploC, *n, *nb, a, *lda, e, tau, w, *ldw);
}
