#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclaqsp_(char* uplo, int* n, void* ap, float* s, float* scond, float* amax, char* equed)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_claqsp(uploC, *n, ap, s, *scond, *amax, equed);
}
