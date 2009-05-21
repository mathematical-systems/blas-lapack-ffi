#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaed6_(int* kniter, long int* orgati, float* rho, float* d, float* z, float* finit, float* tau, int* info)
{
	lapack_slaed6(*kniter, *orgati, *rho, d, z, *finit, tau, info);
}
