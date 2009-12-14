#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fspbrfs_(char* uplo, int* n, int* kd, int* nrhs, float* ab, int* ldab, float* afb, int* ldafb, float* b, int* ldb, float* x, int* ldx, float* ferr, float* berr, float* work, int* iwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_spbrfs(uploC, *n, *kd, *nrhs, ab, *ldab, afb, *ldafb, b, *ldb, x, *ldx, ferr, berr, work, iwork, info);
}
