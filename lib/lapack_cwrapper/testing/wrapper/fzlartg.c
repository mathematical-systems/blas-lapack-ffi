#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlartg_(void* f, void* g, double* cs, void* sn, void* r)
{
	lapack_zlartg(f, g, cs, sn, r);
}
