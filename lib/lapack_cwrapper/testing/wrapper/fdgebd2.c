#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgebd2_(int* m, int* n, double* a, int* lda, double* d, double* e, double* tauq, double* taup, double* work, int* info)
{
	lapack_dgebd2(*m, *n, a, *lda, d, e, tauq, taup, work, info);
}
