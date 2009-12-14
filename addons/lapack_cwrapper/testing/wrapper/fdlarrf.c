#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlarrf_(int* n, double* d, double* l, double* ld, double* lld, int* ifirst, int* ilast, double* w, double* sigma, double* dplus, double* lplus, double* work, int* iwork, int* info)
{
	lapack_dlarrf(*n, d, l, ld, lld, *ifirst, *ilast, w, *sigma, dplus, lplus, work, iwork, info);
}
