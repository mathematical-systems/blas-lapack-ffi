#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgeqpf_(int* m, int* n, void* a, int* lda, int* jpvt, void* tau, void* work, float* rwork, int* info)
{
	lapack_cgeqpf(*m, *n, a, *lda, jpvt, tau, work, rwork, info);
}
