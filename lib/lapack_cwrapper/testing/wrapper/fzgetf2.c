#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgetf2_(int* m, int* n, void* a, int* lda, int* ipiv, int* info)
{
	lapack_zgetf2(*m, *n, a, *lda, ipiv, info);
}
