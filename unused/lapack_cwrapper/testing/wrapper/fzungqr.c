#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzungqr_(int* m, int* n, int* k, void* a, int* lda, void* tau, void* work, int* lwork, int* info)
{
	lapack_zungqr(*m, *n, *k, a, *lda, tau, work, *lwork, info);
}
