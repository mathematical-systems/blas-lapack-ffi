#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclartg_(void* f, void* g, float* cs, void* sn, void* r)
{
	lapack_clartg(f, g, cs, sn, r);
}
