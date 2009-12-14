#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaebz_(int* ijob, int* nitmax, int* n, int* mmax, int* minp, int* nbmin, double* abstol, double* reltol, double* pivmin, double* d, double* e, double* e2, int* nval, double* ab, double* c, int* mout, int* nab, double* work, int* iwork, int* info)
{
	lapack_dlaebz(*ijob, *nitmax, *n, *mmax, *minp, *nbmin, *abstol, *reltol, *pivmin, d, e, e2, nval, ab, c, mout, nab, work, iwork, info);
}
