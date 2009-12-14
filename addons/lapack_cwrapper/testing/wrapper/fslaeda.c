#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaeda_(int* n, int* tlvls, int* curlvl, int* curpbm, int* prmptr, int* perm, int* givptr, int* givcol, float* givnum, float* q, int* qptr, float* z, float* ztemp, int* info)
{
	lapack_slaeda(*n, *tlvls, *curlvl, *curpbm, prmptr, perm, givptr, givcol, givnum, q, qptr, z, ztemp, info);
}
