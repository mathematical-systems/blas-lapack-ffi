#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcpttrs_(char* uplo, int* n, int* nrhs, float* d, void* e, float* b, int* ldb, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_cpttrs(uploC, *n, *nrhs, d, e, b, *ldb, info);
}
