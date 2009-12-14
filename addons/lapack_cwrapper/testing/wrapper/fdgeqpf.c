#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgeqpf_(int* m, int* n, double* a, int* lda, int* jpvt, double* tau, double* work, int* info)
{
	lapack_dgeqpf(*m, *n, a, *lda, jpvt, tau, work, info);
}
