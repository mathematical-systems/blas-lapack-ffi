#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlarrv_(int* n, double* d, double* l, int* isplit, int* m, double* w, int* iblock, double* gersch, double* tol, double* z, int* ldz, int* isuppz, double* work, int* iwork, int* info)
{
	lapack_dlarrv(*n, d, l, isplit, *m, w, iblock, gersch, *tol, z, *ldz, isuppz, work, iwork, info);
}
