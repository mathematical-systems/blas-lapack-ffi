#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgeql2_(int* m, int* n, void* a, int* lda, void* tau, void* work, int* info)
{
	lapack_cgeql2(*m, *n, a, *lda, tau, work, info);
}
