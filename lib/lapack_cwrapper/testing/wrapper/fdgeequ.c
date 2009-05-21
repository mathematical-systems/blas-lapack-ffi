#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgeequ_(int* m, int* n, double* a, int* lda, double* r, double* c, double* rowcnd, double* colcnd, double* amax, int* info)
{
	lapack_dgeequ(*m, *n, a, *lda, r, c, rowcnd, colcnd, amax, info);
}
