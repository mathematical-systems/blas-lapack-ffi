#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclaev2_(void* a, void* b, void* c, float* rt1, float* rt2, float* cs1, void* sn1)
{
	lapack_claev2(a, b, c, rt1, rt2, cs1, sn1);
}
