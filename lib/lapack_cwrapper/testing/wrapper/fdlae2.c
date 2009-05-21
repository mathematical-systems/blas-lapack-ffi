#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlae2_(double* a, double* b, double* c, double* rt1, double* rt2)
{
	lapack_dlae2(*a, *b, *c, rt1, rt2);
}
