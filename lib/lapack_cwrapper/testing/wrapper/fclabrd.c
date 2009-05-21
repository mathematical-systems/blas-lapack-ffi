#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclabrd_(int* m, int* n, int* nb, void* a, int* lda, float* d, float* e, void* tauq, void* taup, void* x, int* ldx, void* y, int* ldy)
{
	lapack_clabrd(*m, *n, *nb, a, *lda, d, e, tauq, taup, x, *ldx, y, *ldy);
}
