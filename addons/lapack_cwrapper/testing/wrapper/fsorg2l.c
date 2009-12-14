#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsorg2l_(int* m, int* n, int* k, float* a, int* lda, float* tau, float* work, int* info)
{
	lapack_sorg2l(*m, *n, *k, a, *lda, tau, work, info);
}
