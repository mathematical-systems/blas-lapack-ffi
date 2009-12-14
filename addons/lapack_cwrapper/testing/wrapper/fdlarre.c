#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlarre_(int* n, double* d, double* e, double* tol, int* nsplit, int* isplit, int* m, double* w, double* woff, double* gersch, double* work, int* info)
{
	lapack_dlarre(*n, d, e, *tol, nsplit, isplit, m, w, woff, gersch, work, info);
}
