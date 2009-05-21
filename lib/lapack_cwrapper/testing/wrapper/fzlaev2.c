#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlaev2_(void* a, void* b, void* c, double* rt1, double* rt2, double* cs1, void* sn1)
{
	lapack_zlaev2(a, b, c, rt1, rt2, cs1, sn1);
}
