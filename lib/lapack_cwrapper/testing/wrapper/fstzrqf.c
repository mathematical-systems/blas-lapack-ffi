#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fstzrqf_(int* m, int* n, float* a, int* lda, float* tau, int* info)
{
	lapack_stzrqf(*m, *n, a, *lda, tau, info);
}
