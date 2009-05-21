#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlacon_(int* n, double* v, double* x, int* isgn, double* est, int* kase)
{
	lapack_dlacon(*n, v, x, isgn, est, kase);
}
