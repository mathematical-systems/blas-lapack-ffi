#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgerqf_(int* m, int* n, float* a, int* lda, float* tau, float* work, int* lwork, int* info)
{
	lapack_sgerqf(*m, *n, a, *lda, tau, work, *lwork, info);
}
