#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlasd0_(int* n, int* sqre, double* d, double* e, double* u, int* ldu, double* vt, int* ldvt, int* smlsiz, int* iwork, double* work, int* info)
{
	lapack_dlasd0(*n, *sqre, d, e, u, *ldu, vt, *ldvt, *smlsiz, iwork, work, info);
}
