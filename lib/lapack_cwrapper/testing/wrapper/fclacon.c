#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclacon_(int* n, void* v, void* x, float* est, int* kase)
{
	lapack_clacon(*n, v, x, est, kase);
}
