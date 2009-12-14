#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fspttrf_(int* n, float* d, float* e, int* info)
{
	lapack_spttrf(*n, d, e, info);
}
