#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgebrd_(int* m, int* n, double* a, int* lda, double* d, double* e, double* tauq, double* taup, double* work, int* lwork, int* info)
{
	lapack_dgebrd(*m, *n, a, *lda, d, e, tauq, taup, work, *lwork, info);
}
