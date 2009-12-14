#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgeqp3_(int* m, int* n, double* a, int* lda, int* jpvt, double* tau, double* work, int* lwork, int* info)
{
	lapack_dgeqp3(*m, *n, a, *lda, jpvt, tau, work, *lwork, info);
}
