#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlatdf_(int* ijob, int* n, double* z, int* ldz, double* rhs, double* rdsum, double* rdscal, int* ipiv, int* jpiv)
{
	lapack_zlatdf(*ijob, *n, z, *ldz, rhs, rdsum, rdscal, ipiv, jpiv);
}
