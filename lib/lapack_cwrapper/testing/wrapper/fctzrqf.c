#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fctzrqf_(int* m, int* n, void* a, int* lda, void* tau, int* info)
{
	lapack_ctzrqf(*m, *n, a, *lda, tau, info);
}
