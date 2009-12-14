#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgelqf_(int* m, int* n, void* a, int* lda, void* tau, void* work, int* lwork, int* info)
{
	lapack_zgelqf(*m, *n, a, *lda, tau, work, *lwork, info);
}
