#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fztzrqf_(int* m, int* n, void* a, int* lda, void* tau, int* info)
{
	lapack_ztzrqf(*m, *n, a, *lda, tau, info);
}
