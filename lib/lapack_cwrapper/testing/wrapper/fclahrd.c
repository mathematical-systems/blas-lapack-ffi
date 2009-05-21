#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclahrd_(int* n, int* k, int* nb, void* a, int* lda, void* tau, void* t, int* ldt, void* y, int* ldy)
{
	lapack_clahrd(*n, *k, *nb, a, *lda, tau, t, *ldt, y, *ldy);
}
