#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclarrv_(int* n, float* d, float* l, int* isplit, int* m, float* w, int* iblock, float* gersch, float* tol, void* z, int* ldz, int* isuppz, float* work, int* iwork, int* info)
{
	lapack_clarrv(*n, d, l, isplit, *m, w, iblock, gersch, *tol, z, *ldz, isuppz, work, iwork, info);
}
