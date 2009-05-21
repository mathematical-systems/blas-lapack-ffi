#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslacon_(int* n, float* v, float* x, int* isgn, float* est, int* kase)
{
	lapack_slacon(*n, v, x, isgn, est, kase);
}
