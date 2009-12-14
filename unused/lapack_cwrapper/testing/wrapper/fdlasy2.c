#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlasy2_(long int* ltranl, long int* ltranr, int* isgn, int* n1, int* n2, double* tl, int* ldtl, double* tr, int* ldtr, double* b, int* ldb, double* scale, double* x, int* ldx, double* xnorm, int* info)
{
	lapack_dlasy2(*ltranl, *ltranr, *isgn, *n1, *n2, tl, *ldtl, tr, *ldtr, b, *ldb, scale, x, *ldx, xnorm, info);
}
