#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgeqp3_(int* m, int* n, void* a, int* lda, int* jpvt, void* tau, void* work, int* lwork, double* rwork, int* info)
{
	lapack_zgeqp3(*m, *n, a, *lda, jpvt, tau, work, *lwork, rwork, info);
}
