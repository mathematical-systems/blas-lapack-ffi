#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaln2_(long int* ltrans, int* na, int* nw, double* smin, double* ca, double* a, int* lda, double* d1, double* d2, double* b, int* ldb, double* wr, double* wi, double* x, int* ldx, double* scale, double* xnorm, int* info)
{
	lapack_dlaln2(*ltrans, *na, *nw, *smin, *ca, a, *lda, *d1, *d2, b, *ldb, *wr, *wi, x, *ldx, scale, xnorm, info);
}
