#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslarrf_(int* n, float* d, float* l, float* ld, float* lld, int* ifirst, int* ilast, float* w, float* sigma, float* dplus, float* lplus, double* work, int* iwork, int* info)
{
	lapack_slarrf(*n, d, l, ld, lld, *ifirst, *ilast, w, *sigma, dplus, lplus, work, iwork, info);
}
