#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlagtf_(int* n, double* a, double* lambda, double* b, double* c, double* tol, double* d, int* in, int* info)
{
	lapack_dlagtf(*n, a, *lambda, b, c, *tol, d, in, info);
}
