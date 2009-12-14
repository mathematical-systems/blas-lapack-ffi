#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlatrd_(char* uplo, int* n, int* nb, double* a, int* lda, double* e, double* tau, double* w, int* ldw)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dlatrd(uploC, *n, *nb, a, *lda, e, tau, w, *ldw);
}
