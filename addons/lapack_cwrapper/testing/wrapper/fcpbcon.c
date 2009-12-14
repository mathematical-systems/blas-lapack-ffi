#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcpbcon_(char* uplo, int* n, int* kd, void* ab, int* ldab, float* anorm, float* rcond, void* work, float* rwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_cpbcon(uploC, *n, *kd, ab, *ldab, *anorm, rcond, work, rwork, info);
}
