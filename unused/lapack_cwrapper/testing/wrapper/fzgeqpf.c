#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgeqpf_(int* m, int* n, void* a, int* lda, int* jpvt, void* tau, void* work, double* rwork, int* info)
{
	lapack_zgeqpf(*m, *n, a, *lda, jpvt, tau, work, rwork, info);
}
