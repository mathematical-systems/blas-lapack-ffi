#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdppcon_(char* uplo, int* n, double* ap, double* anorm, double* rcond, double* work, int* iwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dppcon(uploC, *n, ap, *anorm, rcond, work, iwork, info);
}
