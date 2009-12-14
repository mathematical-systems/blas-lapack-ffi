#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlahrd_(int* n, int* k, int* nb, void* a, int* lda, void* tau, void* t, int* ldt, void* y, int* ldy)
{
	lapack_zlahrd(*n, *k, *nb, a, *lda, tau, t, *ldt, y, *ldy);
}
