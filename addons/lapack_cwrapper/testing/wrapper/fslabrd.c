#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslabrd_(int* m, int* n, int* nb, float* a, int* lda, float* d, float* e, float* tauq, float* taup, float* x, int* ldx, float* y, int* ldy)
{
	lapack_slabrd(*m, *n, *nb, a, *lda, d, e, tauq, taup, x, *ldx, y, *ldy);
}
