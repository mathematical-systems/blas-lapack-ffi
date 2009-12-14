#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclatdf_(int* ijob, int* n, float* z, int* ldz, float* rhs, float* rdsum, float* rdscal, int* ipiv, int* jpiv)
{
	lapack_clatdf(*ijob, *n, z, *ldz, rhs, rdsum, rdscal, ipiv, jpiv);
}
