#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaqge_(int* m, int* n, double* a, int* lda, double* r, double* c, double* rowcnd, double* colcnd, double* amax, char* equed)
{
	lapack_dlaqge(*m, *n, a, *lda, r, c, *rowcnd, *colcnd, *amax, equed);
}
