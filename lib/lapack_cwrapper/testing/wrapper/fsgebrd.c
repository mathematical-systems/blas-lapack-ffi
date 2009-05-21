#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgebrd_(int* m, int* n, float* a, int* lda, float* d, float* e, float* tauq, float* taup, float* work, int* lwork, int* info)
{
	lapack_sgebrd(*m, *n, a, *lda, d, e, tauq, taup, work, *lwork, info);
}
