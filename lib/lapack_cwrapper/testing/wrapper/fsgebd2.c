#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgebd2_(int* m, int* n, float* a, int* lda, float* d, float* e, float* tauq, float* taup, float* work, int* info)
{
	lapack_sgebd2(*m, *n, a, *lda, d, e, tauq, taup, work, info);
}
