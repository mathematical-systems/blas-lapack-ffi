#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzungl2_(int* m, int* n, int* k, void* a, int* lda, void* tau, void* work, int* info)
{
	lapack_zungl2(*m, *n, *k, a, *lda, tau, work, info);
}
