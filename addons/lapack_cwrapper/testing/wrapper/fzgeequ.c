#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgeequ_(int* m, int* n, void* a, int* lda, double* r, double* c, double* rowcnd, double* colcnd, double* amax, int* info)
{
	lapack_zgeequ(*m, *n, a, *lda, r, c, rowcnd, colcnd, amax, info);
}
