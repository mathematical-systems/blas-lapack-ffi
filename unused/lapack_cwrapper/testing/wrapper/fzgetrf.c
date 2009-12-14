#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgetrf_(int* m, int* n, void* a, int* lda, int* ipiv, int* info)
{
	lapack_zgetrf(*m, *n, a, *lda, ipiv, info);
}
