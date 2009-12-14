#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdsytrd_(char* uplo, int* n, double* a, int* lda, double* d, double* e, double* tau, double* work, int* lwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dsytrd(uploC, *n, a, *lda, d, e, tau, work, *lwork, info);
}
