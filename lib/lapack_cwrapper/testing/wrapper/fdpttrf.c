#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdpttrf_(int* n, double* d, double* e, int* info)
{
	lapack_dpttrf(*n, d, e, info);
}
