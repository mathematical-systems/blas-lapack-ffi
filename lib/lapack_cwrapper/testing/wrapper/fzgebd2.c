#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgebd2_(int* m, int* n, void* a, int* lda, double* d, double* e, void* tauq, void* taup, void* work, int* info)
{
	lapack_zgebd2(*m, *n, a, *lda, d, e, tauq, taup, work, info);
}
