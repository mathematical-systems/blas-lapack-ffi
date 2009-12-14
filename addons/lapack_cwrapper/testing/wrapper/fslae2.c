#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslae2_(float* a, float* b, float* c, float* rt1, float* rt2)
{
	lapack_slae2(*a, *b, *c, rt1, rt2);
}
