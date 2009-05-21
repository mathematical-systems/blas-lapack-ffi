#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdladiv_(double* a, double* b, double* c, double* d, double* p, double* q)
{
	lapack_dladiv(*a, *b, *c, *d, p, q);
}
