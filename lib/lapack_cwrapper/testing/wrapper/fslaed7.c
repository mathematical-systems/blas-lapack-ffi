#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaed7_(int* icompq, int* n, int* qsiz, int* tlvls, int* curlvl, int* curpbm, float* d, float* q, int* ldq, int* indxq, float* rho, int* cutpnt, float* qstore, int* qptr, int* prmptr, int* perm, int* givptr, int* givcol, float* givnum, float* work, int* iwork, int* info)
{
	lapack_slaed7(*icompq, *n, *qsiz, *tlvls, *curlvl, *curpbm, d, q, *ldq, indxq, *rho, *cutpnt, qstore, qptr, prmptr, perm, givptr, givcol, givnum, work, iwork, info);
}
