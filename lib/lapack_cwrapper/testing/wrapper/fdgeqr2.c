#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgeqr2_(int* m, int* n, double* a, int* lda, double* tau, double* work, int* info)
{
	lapack_dgeqr2(*m, *n, a, *lda, tau, work, info);
}
