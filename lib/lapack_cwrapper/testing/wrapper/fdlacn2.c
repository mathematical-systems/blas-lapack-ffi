#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlacn2_(int* n, double* v, double* x, int* isgn, double* est, int* kase, int* isave)
{
	lapack_dlacn2(*n, v, x, isgn, est, kase, isave);
}
