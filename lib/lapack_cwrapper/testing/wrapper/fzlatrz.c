#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlatrz_(int* m, int* n, int* l, void* a, int* lda, void* tau, void* work)
{
	lapack_zlatrz(*m, *n, *l, a, *lda, tau, work);
}
