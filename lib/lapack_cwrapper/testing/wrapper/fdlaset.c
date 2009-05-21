#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaset_(char* uplo, int* m, int* n, double* alpha, double* beta, double* a, int* lda)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dlaset(uploC, *m, *n, *alpha, *beta, a, *lda);
}
