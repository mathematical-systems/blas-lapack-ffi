#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlagv2_(double* a, int* lda, double* b, int* ldb, double* alphar, double* alphai, double* beta, double* csl, double* snl, double* csr, double* snr)
{
	lapack_dlagv2(a, *lda, b, *ldb, alphar, alphai, beta, csl, snl, csr, snr);
}
