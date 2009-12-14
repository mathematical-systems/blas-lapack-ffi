#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzpbequ_(char* uplo, int* n, int* kd, void* ab, int* ldab, double* s, double* scond, double* amax, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zpbequ(uploC, *n, *kd, ab, *ldab, s, scond, amax, info);
}
