#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslarrb_(int* n, float* d, float* l, float* ld, float* lld, int* ifirst, int* ilast, float* sigma, float* reltol, float* w, float* wgap, float* werr, float* work, int* iwork, int* info)
{
	lapack_slarrb(*n, d, l, ld, lld, *ifirst, *ilast, *sigma, *reltol, w, wgap, werr, work, iwork, info);
}
