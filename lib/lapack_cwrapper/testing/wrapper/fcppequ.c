#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcppequ_(char* uplo, int* n, void* ap, float* s, float* scond, float* amax, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_cppequ(uploC, *n, ap, s, scond, amax, info);
}
