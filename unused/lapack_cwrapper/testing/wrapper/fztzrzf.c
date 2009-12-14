#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fztzrzf_(int* m, int* n, void* a, int* lda, void* tau, void* work, int* lwork, int* info)
{
	lapack_ztzrzf(*m, *n, a, *lda, tau, work, *lwork, info);
}
