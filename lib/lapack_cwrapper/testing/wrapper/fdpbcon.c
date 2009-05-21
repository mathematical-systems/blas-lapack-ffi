#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdpbcon_(char* uplo, int* n, int* kd, double* ab, int* ldab, double* anorm, double* rcond, double* work, int* iwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dpbcon(uploC, *n, *kd, ab, *ldab, *anorm, rcond, work, iwork, info);
}
