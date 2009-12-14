#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaln2_(long int* ltrans, int* na, int* nw, float* smin, float* ca, float* a, int* lda, float* d1, float* d2, float* b, int* ldb, float* wr, float* wi, float* x, int* ldx, float* scale, float* xnorm, int* info)
{
	lapack_slaln2(*ltrans, *na, *nw, *smin, *ca, a, *lda, *d1, *d2, b, *ldb, *wr, *wi, x, *ldx, scale, xnorm, info);
}
