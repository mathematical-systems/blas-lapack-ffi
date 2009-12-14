#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslahrd_(int* n, int* k, int* nb, float* a, int* lda, float* tau, float* t, int* ldt, float* y, int* ldy)
{
	lapack_slahrd(*n, *k, *nb, a, *lda, tau, t, *ldt, y, *ldy);
}
