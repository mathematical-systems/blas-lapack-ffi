#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaset_(char* uplo, int* m, int* n, float* alpha, float* beta, float* a, int* lda)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_slaset(uploC, *m, *n, *alpha, *beta, a, *lda);
}
