#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcppcon_(char* uplo, int* n, void* ap, float* anorm, float* rcond, void* work, float* rwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_cppcon(uploC, *n, ap, *anorm, rcond, work, rwork, info);
}
