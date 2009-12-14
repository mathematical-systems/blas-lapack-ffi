#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasd0_(int* n, int* sqre, float* d, float* e, float* u, int* ldu, float* vt, int* ldvt, int* smlsiz, int* iwork, float* work, int* info)
{
	lapack_slasd0(*n, *sqre, d, e, u, *ldu, vt, *ldvt, *smlsiz, iwork, work, info);
}
