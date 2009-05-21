#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fspbtf2_(char* uplo, int* n, int* kd, float* ab, int* ldab, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_spbtf2(uploC, *n, *kd, ab, *ldab, info);
}
