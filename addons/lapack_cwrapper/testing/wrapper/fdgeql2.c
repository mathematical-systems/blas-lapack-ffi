#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgeql2_(int* m, int* n, double* a, int* lda, double* tau, double* work, int* info)
{
	lapack_dgeql2(*m, *n, a, *lda, tau, work, info);
}
