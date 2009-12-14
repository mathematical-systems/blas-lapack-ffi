#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcptrfs_(char* uplo, int* n, int* nrhs, float* d, void* e, float* df, void* ef, void* b, int* ldb, void* x, int* ldx, float* ferr, float* berr, void* work, float* rwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_cptrfs(uploC, *n, *nrhs, d, e, df, ef, b, *ldb, x, *ldx, ferr, berr, work, rwork, info);
}
