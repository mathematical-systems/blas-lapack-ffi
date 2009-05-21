#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fstzrzf_(int* m, int* n, float* a, int* lda, float* tau, float* work, int* lwork, int* info)
{
	lapack_stzrzf(*m, *n, a, *lda, tau, work, *lwork, info);
}
