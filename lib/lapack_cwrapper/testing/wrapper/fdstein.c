#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdstein_(int* n, double* d, double* e, int* m, double* w, int* iblock, int* isplit, double* z, int* ldz, double* work, int* iwork, int* ifail, int* info)
{
	lapack_dstein(*n, d, e, *m, w, iblock, isplit, z, *ldz, work, iwork, ifail, info);
}
