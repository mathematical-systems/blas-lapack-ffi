#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlasq2_(int* n, double* z, int* info)
{
	lapack_dlasq2(*n, z, info);
}
