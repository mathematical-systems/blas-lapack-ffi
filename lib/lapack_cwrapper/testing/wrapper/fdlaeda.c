#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaeda_(int* n, int* tlvls, int* curlvl, int* curpbm, int* prmptr, int* perm, int* givptr, int* givcol, double* givnum, double* q, int* qptr, double* z, double* ztemp, int* info)
{
	lapack_dlaeda(*n, *tlvls, *curlvl, *curpbm, prmptr, perm, givptr, givcol, givnum, q, qptr, z, ztemp, info);
}
