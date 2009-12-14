#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlaqhb_(char* uplo, int* n, int* kd, void* ab, int* ldab, double* s, double* scond, double* amax, char* equed)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zlaqhb(uploC, *n, *kd, ab, *ldab, s, *scond, *amax, equed);
}
