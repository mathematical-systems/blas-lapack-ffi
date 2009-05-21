#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlartg_(double* f, double* g, double* cs, double* sn, double* r)
{
	lapack_dlartg(*f, *g, cs, sn, r);
}
