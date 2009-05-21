#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgebrd_(int* m, int* n, void* a, int* lda, float* d, float* e, void* tauq, void* taup, void* work, int* lwork, int* info)
{
	lapack_cgebrd(*m, *n, a, *lda, d, e, tauq, taup, work, *lwork, info);
}
