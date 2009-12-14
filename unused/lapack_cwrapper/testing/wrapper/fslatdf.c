#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslatdf_(int* ijob, int* n, float* z, int* ldz, float* rhs, float* rdsum, float* rdscal, int* ipiv, int* jpiv)
{
	lapack_slatdf(*ijob, *n, z, *ldz, rhs, rdsum, rdscal, ipiv, jpiv);
}
