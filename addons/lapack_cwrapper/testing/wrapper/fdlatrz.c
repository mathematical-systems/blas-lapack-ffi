#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlatrz_(int* m, int* n, int* l, double* a, int* lda, double* tau, double* work)
{
	lapack_dlatrz(*m, *n, *l, a, *lda, tau, work);
}
