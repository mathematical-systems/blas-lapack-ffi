#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fspbtrs_(char* uplo, int* n, int* kd, int* nrhs, float* ab, int* ldab, float* b, int* ldb, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_spbtrs(uploC, *n, *kd, *nrhs, ab, *ldab, b, *ldb, info);
}
