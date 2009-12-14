#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgetrf_(int* m, int* n, void* a, int* lda, int* ipiv, int* info)
{
	lapack_cgetrf(*m, *n, a, *lda, ipiv, info);
}
