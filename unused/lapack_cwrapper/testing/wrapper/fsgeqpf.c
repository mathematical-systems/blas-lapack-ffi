#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgeqpf_(int* m, int* n, float* a, int* lda, int* jpvt, float* tau, float* work, int* info)
{
	lapack_sgeqpf(*m, *n, a, *lda, jpvt, tau, work, info);
}
