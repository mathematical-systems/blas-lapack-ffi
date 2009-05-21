#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcpbequ_(char* uplo, int* n, int* kd, void* ab, int* ldab, float* s, float* scond, float* amax, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_cpbequ(uploC, *n, *kd, ab, *ldab, s, scond, amax, info);
}
