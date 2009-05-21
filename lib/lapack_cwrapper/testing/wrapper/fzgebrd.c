#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgebrd_(int* m, int* n, void* a, int* lda, double* d, double* e, void* tauq, void* taup, void* work, int* lwork, int* info)
{
	lapack_zgebrd(*m, *n, a, *lda, d, e, tauq, taup, work, *lwork, info);
}
