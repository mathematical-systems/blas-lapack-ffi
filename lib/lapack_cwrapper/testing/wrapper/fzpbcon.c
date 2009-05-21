#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzpbcon_(char* uplo, int* n, int* kd, void* ab, int* ldab, double* anorm, double* rcond, void* work, double* rwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zpbcon(uploC, *n, *kd, ab, *ldab, *anorm, rcond, work, rwork, info);
}
