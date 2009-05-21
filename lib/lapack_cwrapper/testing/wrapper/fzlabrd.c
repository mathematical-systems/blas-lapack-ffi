#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlabrd_(int* m, int* n, int* nb, void* a, int* lda, double* d, double* e, void* tauq, void* taup, void* x, int* ldx, void* y, int* ldy)
{
	lapack_zlabrd(*m, *n, *nb, a, *lda, d, e, tauq, taup, x, *ldx, y, *ldy);
}
