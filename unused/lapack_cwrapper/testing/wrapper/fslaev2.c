#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaev2_(float* a, float* b, float* c, float* rt1, float* rt2, float* cs1, float* sn1)
{
	lapack_slaev2(*a, *b, *c, rt1, rt2, cs1, sn1);
}
