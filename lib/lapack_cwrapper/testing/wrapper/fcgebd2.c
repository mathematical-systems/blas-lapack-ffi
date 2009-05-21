#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgebd2_(int* m, int* n, void* a, int* lda, float* d, float* e, void* tauq, void* taup, void* work, int* info)
{
	lapack_cgebd2(*m, *n, a, *lda, d, e, tauq, taup, work, info);
}
