#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcpttrf_(int* n, float* d, void* e, int* info)
{
	lapack_cpttrf(*n, d, e, info);
}
