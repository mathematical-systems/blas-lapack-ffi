#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasq2_(int* n, float* z, int* info)
{
	lapack_slasq2(*n, z, info);
}
