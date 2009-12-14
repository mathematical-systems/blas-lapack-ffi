#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslatrz_(int* m, int* n, int* l, float* a, int* lda, float* tau, float* work)
{
	lapack_slatrz(*m, *n, *l, a, *lda, tau, work);
}
