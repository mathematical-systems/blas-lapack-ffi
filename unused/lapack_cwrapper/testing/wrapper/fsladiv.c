#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsladiv_(float* a, float* b, float* c, float* d, float* p, float* q)
{
	lapack_sladiv(*a, *b, *c, *d, p, q);
}
