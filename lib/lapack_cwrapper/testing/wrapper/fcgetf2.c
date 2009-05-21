#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgetf2_(int* m, int* n, void* a, int* lda, int* ipiv, int* info)
{
	lapack_cgetf2(*m, *n, a, *lda, ipiv, info);
}
