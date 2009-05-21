#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslagv2_(float* a, int* lda, float* b, int* ldb, float* alphar, float* alphai, float* beta, float* csl, float* snl, float* csr, float* snr)
{
	lapack_slagv2(a, *lda, b, *ldb, alphar, alphai, beta, csl, snl, csr, snr);
}
