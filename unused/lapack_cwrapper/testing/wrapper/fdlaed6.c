#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaed6_(int* kniter, long int* orgati, double* rho, double* d, double* z, double* finit, double* tau, int* info)
{
	lapack_dlaed6(*kniter, *orgati, *rho, d, z, *finit, tau, info);
}
