#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcungl2_(int* m, int* n, int* k, void* a, int* lda, void* tau, void* work, int* info)
{
	lapack_cungl2(*m, *n, *k, a, *lda, tau, work, info);
}
