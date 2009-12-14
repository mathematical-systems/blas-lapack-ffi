#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslagtf_(int* n, float* a, float* lambda, float* b, float* c, float* tol, float* d, int* in, int* info)
{
	lapack_slagtf(*n, a, *lambda, b, c, *tol, d, in, info);
}
