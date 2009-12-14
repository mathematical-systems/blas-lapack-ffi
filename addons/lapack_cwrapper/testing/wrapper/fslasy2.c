#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasy2_(long int* ltranl, long int* ltranr, int* isgn, int* n1, int* n2, float* tl, int* ldtl, float* tr, int* ldtr, float* b, int* ldb, float* scale, float* x, int* ldx, float* xnorm, int* info)
{
	lapack_slasy2(*ltranl, *ltranr, *isgn, *n1, *n2, tl, *ldtl, tr, *ldtr, b, *ldb, scale, x, *ldx, xnorm, info);
}
