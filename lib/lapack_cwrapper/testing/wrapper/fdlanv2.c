#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlanv2_(double* a, double* b, double* c, double* d, double* rt1r, double* rt1i, double* rt2r, double* rt2i, double* cs, double* sn)
{
	lapack_dlanv2(a, b, c, d, rt1r, rt1i, rt2r, rt2i, cs, sn);
}
