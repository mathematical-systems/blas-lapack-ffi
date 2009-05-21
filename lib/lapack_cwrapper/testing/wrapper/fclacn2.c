#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclacn2_(int* n, void* v, void* x, float* est, int* kase, int* isave)
{
	lapack_clacn2(*n, v, x, est, kase, isave);
}
