#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlaqge_(int* m, int* n, void* a, int* lda, double* r, double* c, double* rowcnd, double* colcnd, double* amax, char* equed)
{
	lapack_zlaqge(*m, *n, a, *lda, r, c, *rowcnd, *colcnd, *amax, equed);
}
