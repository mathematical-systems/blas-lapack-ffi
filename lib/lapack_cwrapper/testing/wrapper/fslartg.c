#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslartg_(float* f, float* g, float* cs, float* sn, float* r)
{
	lapack_slartg(*f, *g, cs, sn, r);
}
