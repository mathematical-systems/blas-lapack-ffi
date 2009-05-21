#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzung2r_(int* m, int* n, int* k, void* a, int* lda, void* tau, void* work, int* info)
{
	lapack_zung2r(*m, *n, *k, a, *lda, tau, work, info);
}
