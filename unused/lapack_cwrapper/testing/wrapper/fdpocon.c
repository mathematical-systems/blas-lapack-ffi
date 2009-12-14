#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdpocon_(char* uplo, int* n, double* a, int* lda, double* anorm, double* rcond, double* work, int* iwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dpocon(uploC, *n, a, *lda, *anorm, rcond, work, iwork, info);
}
