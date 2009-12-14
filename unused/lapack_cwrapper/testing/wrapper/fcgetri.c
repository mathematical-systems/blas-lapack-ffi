#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgetri_(int* n, void* a, int* lda, int* ipiv, void* work, int* lwork, int* info)
{
	lapack_cgetri(*n, a, *lda, ipiv, work, *lwork, info);
}
