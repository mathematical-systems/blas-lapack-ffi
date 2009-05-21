#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsstein_(int* n, float* d, float* e, int* m, float* w, int* iblock, int* isplit, float* z, int* ldz, float* work, int* iwork, int* ifail, int* info)
{
	lapack_sstein(*n, d, e, *m, w, iblock, isplit, z, *ldz, work, iwork, ifail, info);
}
