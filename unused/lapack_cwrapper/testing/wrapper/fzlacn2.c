#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlacn2_(int* n, void* v, void* x, double* est, int* kase, int* isave)
{
	lapack_zlacn2(*n, v, x, est, kase, isave);
}
