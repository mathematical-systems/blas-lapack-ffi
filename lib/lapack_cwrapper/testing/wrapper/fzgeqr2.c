#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgeqr2_(int* m, int* n, void* a, int* lda, void* tau, void* work, int* info)
{
	lapack_zgeqr2(*m, *n, a, *lda, tau, work, info);
}
