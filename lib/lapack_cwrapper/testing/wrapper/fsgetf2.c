#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgetf2_(int* m, int* n, float* a, int* lda, int* ipiv, int* info)
{
	lapack_sgetf2(*m, *n, a, *lda, ipiv, info);
}
