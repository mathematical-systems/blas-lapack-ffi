#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlatdf_(int* ijob, int* n, double* z, int* ldz, double* rhs, double* rdsum, double* rdscal, int* ipiv, int* jpiv)
{
	lapack_dlatdf(*ijob, *n, z, *ldz, rhs, rdsum, rdscal, ipiv, jpiv);
}
