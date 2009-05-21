#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fssytd2_(char* uplo, int* n, float* a, int* lda, float* d, float* e, float* tau, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_ssytd2(uploC, *n, a, *lda, d, e, tau, info);
}
