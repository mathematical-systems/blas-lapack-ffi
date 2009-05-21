#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsorgl2_(int* m, int* n, int* k, float* a, int* lda, float* tau, float* work, int* info)
{
	lapack_sorgl2(*m, *n, *k, a, *lda, tau, work, info);
}
