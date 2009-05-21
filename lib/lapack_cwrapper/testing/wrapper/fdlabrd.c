#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlabrd_(int* m, int* n, int* nb, double* a, int* lda, double* d, double* e, double* tauq, double* taup, double* x, int* ldx, double* y, int* ldy)
{
	lapack_dlabrd(*m, *n, *nb, a, *lda, d, e, tauq, taup, x, *ldx, y, *ldy);
}
