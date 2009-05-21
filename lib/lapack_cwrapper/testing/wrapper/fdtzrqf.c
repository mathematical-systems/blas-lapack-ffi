#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdtzrqf_(int* m, int* n, double* a, int* lda, double* tau, int* info)
{
	lapack_dtzrqf(*m, *n, a, *lda, tau, info);
}
