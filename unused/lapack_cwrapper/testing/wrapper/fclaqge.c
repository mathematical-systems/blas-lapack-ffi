#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclaqge_(int* m, int* n, void* a, int* lda, float* r, float* c, float* rowcnd, float* colcnd, float* amax, char* equed)
{
	lapack_claqge(*m, *n, a, *lda, r, c, *rowcnd, *colcnd, *amax, equed);
}
