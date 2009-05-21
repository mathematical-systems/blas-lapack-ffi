#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgeqp3_(int* m, int* n, float* a, int* lda, int* jpvt, float* tau, float* work, int* lwork, int* info)
{
	lapack_sgeqp3(*m, *n, a, *lda, jpvt, tau, work, *lwork, info);
}
