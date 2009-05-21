#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgetri_(int* n, void* a, int* lda, int* ipiv, void* work, int* lwork, int* info)
{
	lapack_zgetri(*n, a, *lda, ipiv, work, *lwork, info);
}
