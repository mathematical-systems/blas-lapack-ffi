#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlahrd_(int* n, int* k, int* nb, double* a, int* lda, double* tau, double* t, int* ldt, double* y, int* ldy)
{
	lapack_dlahrd(*n, *k, *nb, a, *lda, tau, t, *ldt, y, *ldy);
}
