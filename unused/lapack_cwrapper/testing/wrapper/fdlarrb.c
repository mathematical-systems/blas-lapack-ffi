#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlarrb_(int* n, double* d, double* l, double* ld, double* lld, int* ifirst, int* ilast, double* sigma, double* reltol, double* w, double* wgap, double* werr, double* work, int* iwork, int* info)
{
	lapack_dlarrb(*n, d, l, ld, lld, *ifirst, *ilast, *sigma, *reltol, w, wgap, werr, work, iwork, info);
}
