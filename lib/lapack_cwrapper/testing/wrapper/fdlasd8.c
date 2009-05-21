#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlasd8_(int* icompq, int* k, double* d, double* z, double* vf, double* vl, double* difl, double* difr, int* lddifr, double* dsigma, double* work, int* info)
{
	lapack_dlasd8(*icompq, *k, d, z, vf, vl, difl, difr, *lddifr, dsigma, work, info);
}
