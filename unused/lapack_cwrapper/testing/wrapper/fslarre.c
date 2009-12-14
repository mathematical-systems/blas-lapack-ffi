#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslarre_(int* n, float* d, float* e, float* tol, int* nsplit, int* isplit, int* m, float* w, float* woff, float* gersch, float* work, int* info)
{
	lapack_slarre(*n, d, e, *tol, nsplit, isplit, m, w, woff, gersch, work, info);
}
