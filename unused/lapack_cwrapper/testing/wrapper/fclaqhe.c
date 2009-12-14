#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclaqhe_(char* uplo, int* n, void* a, int* lda, float* s, float* scond, float* amax, char* equed)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_claqhe(uploC, *n, a, *lda, s, *scond, *amax, equed);
}
