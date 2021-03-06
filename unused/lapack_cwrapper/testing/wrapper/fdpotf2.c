#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdpotf2_(char* uplo, int* n, double* a, int* lda, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dpotf2(uploC, *n, a, *lda, info);
}
