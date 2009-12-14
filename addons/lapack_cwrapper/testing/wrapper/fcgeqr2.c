#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgeqr2_(int* m, int* n, void* a, int* lda, void* tau, void* work, int* info)
{
	lapack_cgeqr2(*m, *n, a, *lda, tau, work, info);
}
