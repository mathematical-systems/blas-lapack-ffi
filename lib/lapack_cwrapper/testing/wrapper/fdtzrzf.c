#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdtzrzf_(int* m, int* n, double* a, int* lda, double* tau, double* work, int* lwork, int* info)
{
	lapack_dtzrzf(*m, *n, a, *lda, tau, work, *lwork, info);
}
