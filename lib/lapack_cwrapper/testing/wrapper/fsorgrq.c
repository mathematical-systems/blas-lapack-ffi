#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsorgrq_(int* m, int* n, int* k, float* a, int* lda, float* tau, float* work, int* lwork, int* info)
{
	lapack_sorgrq(*m, *n, *k, a, *lda, tau, work, *lwork, info);
}
