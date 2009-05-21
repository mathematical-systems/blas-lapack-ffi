#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlagts_(int* job, int* n, double* a, double* b, double* c, double* d, int* in, double* y, double* tol, int* info)
{
	lapack_dlagts(*job, *n, a, b, c, d, in, y, tol, info);
}
