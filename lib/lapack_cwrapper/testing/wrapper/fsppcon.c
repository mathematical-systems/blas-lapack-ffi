#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsppcon_(char* uplo, int* n, float* ap, float* anorm, float* rcond, float* work, int* iwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_sppcon(uploC, *n, ap, *anorm, rcond, work, iwork, info);
}
