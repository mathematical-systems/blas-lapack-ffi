#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzpbrfs_(char* uplo, int* n, int* kd, int* nrhs, double* ab, int* ldab, void* afb, int* ldafb, void* b, int* ldb, void* x, int* ldx, double* ferr, double* berr, void* work, double* rwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zpbrfs(uploC, *n, *kd, *nrhs, ab, *ldab, afb, *ldafb, b, *ldb, x, *ldx, ferr, berr, work, rwork, info);
}
