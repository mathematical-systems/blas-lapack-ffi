#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgerq2_(int* m, int* n, void* a, int* lda, void* tau, void* work, int* info)
{
	lapack_cgerq2(*m, *n, a, *lda, tau, work, info);
}
