#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslarrv_(int* n, float* d, float* l, int* isplit, int* m, float* w, int* iblock, float* gersch, float* tol, float* z, int* ldz, int* isuppz, float* work, int* iwork, int* info)
{
	lapack_slarrv(*n, d, l, isplit, *m, w, iblock, gersch, *tol, z, *ldz, isuppz, work, iwork, info);
}
