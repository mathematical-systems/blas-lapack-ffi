#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcung2l_(int* m, int* n, int* k, void* a, int* lda, void* tau, void* work, int* info)
{
	lapack_cung2l(*m, *n, *k, a, *lda, tau, work, info);
}
