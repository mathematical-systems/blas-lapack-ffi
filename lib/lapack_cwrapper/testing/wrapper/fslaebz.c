#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaebz_(int* ijob, int* nitmax, int* n, int* mmax, int* minp, int* nbmin, float* abstol, float* reltol, float* pivmin, float* d, float* e, float* e2, int* nval, float* ab, float* c, int* mout, int* nab, float* work, int* iwork, int* info)
{
	lapack_slaebz(*ijob, *nitmax, *n, *mmax, *minp, *nbmin, *abstol, *reltol, *pivmin, d, e, e2, nval, ab, c, mout, nab, work, iwork, info);
}
