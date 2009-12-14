#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaqsy_(char* uplo, int* n, float* a, int* lda, float* s, float* scond, float* amax, char* equed)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_slaqsy(uploC, *n, a, *lda, s, *scond, *amax, equed);
}
