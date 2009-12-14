#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgeqrf_(int* m, int* n, void* a, int* lda, void* tau, void* work, int* lwork, int* info)
{
	lapack_zgeqrf(*m, *n, a, *lda, tau, work, *lwork, info);
}
