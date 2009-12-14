#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlacon_(int* n, void* v, void* x, double* est, int* kase)
{
	lapack_zlacon(*n, v, x, est, kase);
}
