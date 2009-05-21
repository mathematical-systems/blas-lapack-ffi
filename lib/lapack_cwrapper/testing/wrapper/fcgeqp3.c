#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgeqp3_(int* m, int* n, void* a, int* lda, int* jpvt, void* tau, void* work, int* lwork, float* rwork, int* info)
{
	lapack_cgeqp3(*m, *n, a, *lda, jpvt, tau, work, *lwork, rwork, info);
}
