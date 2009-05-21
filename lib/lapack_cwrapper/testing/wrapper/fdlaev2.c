#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaev2_(double* a, double* b, double* c, double* rt1, double* rt2, double* cs1, double* sn1)
{
	lapack_dlaev2(*a, *b, *c, rt1, rt2, cs1, sn1);
}
