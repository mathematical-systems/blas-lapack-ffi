#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslacn2_(int* n, float* v, float* x, int* isgn, float* est, int* kase, int* isave)
{
	lapack_slacn2(*n, v, x, isgn, est, kase, isave);
}
