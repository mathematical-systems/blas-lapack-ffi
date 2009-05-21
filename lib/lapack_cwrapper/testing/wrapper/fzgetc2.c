#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgetc2_(int* n, void* a, int* lda, int* ipiv, int* jpiv, int* info)
{
	lapack_zgetc2(*n, a, *lda, ipiv, jpiv, info);
}
