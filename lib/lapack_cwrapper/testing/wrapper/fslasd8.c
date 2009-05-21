#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasd8_(int* icompq, int* k, float* d, float* z, float* vf, float* vl, float* difl, float* difr, int* lddifr, float* dsigma, float* work, int* info)
{
	lapack_slasd8(*icompq, *k, d, z, vf, vl, difl, difr, *lddifr, dsigma, work, info);
}
