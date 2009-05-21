#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlasq1_(int* n, double* d, double* e, double* work, int* info)
{
	lapack_dlasq1(*n, d, e, work, info);
}
