#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fspbcon_(char* uplo, int* n, int* kd, float* ab, int* ldab, float* anorm, float* rcond, float* work, int* iwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_spbcon(uploC, *n, *kd, ab, *ldab, *anorm, rcond, work, iwork, info);
}
