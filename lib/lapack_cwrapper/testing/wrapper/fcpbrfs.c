#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcpbrfs_(char* uplo, int* n, int* kd, int* nrhs, void* ab, int* ldab, void* afb, int* ldafb, void* b, int* ldb, void* x, int* ldx, float* ferr, float* berr, void* work, float* rwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_cpbrfs(uploC, *n, *kd, *nrhs, ab, *ldab, afb, *ldafb, b, *ldb, x, *ldx, ferr, berr, work, rwork, info);
}
