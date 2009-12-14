#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgeequ_(int* m, int* n, float* a, int* lda, float* r, float* c, float* rowcnd, float* colcnd, float* amax, int* info)
{
	lapack_sgeequ(*m, *n, a, *lda, r, c, rowcnd, colcnd, amax, info);
}
