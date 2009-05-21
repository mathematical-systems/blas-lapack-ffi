#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzpttrs_(char* uplo, int* n, int* nrhs, double* d, void* e, double* b, int* ldb, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zpttrs(uploC, *n, *nrhs, d, e, b, *ldb, info);
}
