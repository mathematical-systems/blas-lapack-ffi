#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaqge_(int* m, int* n, float* a, int* lda, float* r, float* c, float* rowcnd, float* colcnd, float* amax, char* equed)
{
	lapack_slaqge(*m, *n, a, *lda, r, c, *rowcnd, *colcnd, *amax, equed);
}
