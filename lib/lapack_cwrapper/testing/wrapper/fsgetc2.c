#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgetc2_(int* n, float* a, int* lda, int* ipiv, int* jpiv, int* info)
{
	lapack_sgetc2(*n, a, *lda, ipiv, jpiv, info);
}
