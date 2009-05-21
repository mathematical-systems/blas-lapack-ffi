#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgeequ_(int* m, int* n, void* a, int* lda, float* r, float* c, float* rowcnd, float* colcnd, float* amax, int* info)
{
	lapack_cgeequ(*m, *n, a, *lda, r, c, rowcnd, colcnd, amax, info);
}
