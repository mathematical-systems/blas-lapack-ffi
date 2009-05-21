#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasq1_(int* n, float* d, float* e, float* work, int* info)
{
	lapack_slasq1(*n, d, e, work, info);
}
