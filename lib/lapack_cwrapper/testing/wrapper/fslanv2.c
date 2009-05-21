#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslanv2_(float* a, float* b, float* c, float* d, float* rt1r, float* rt1i, float* rt2r, float* rt2i, float* cs, float* sn)
{
	lapack_slanv2(a, b, c, d, rt1r, rt1i, rt2r, rt2i, cs, sn);
}
