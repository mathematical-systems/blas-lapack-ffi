#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclaed7_(int* n, int* cutpnt, int* qsiz, int* tlvls, int* curlvl, int* curpbm, float* d, void* q, int* ldq, float* rho, int* indxq, int* iwork, float* rwork, void* work, float* qstore, int* qptr, int* prmptr, int* perm, int* givptr, int* givcol, float* givnum, int* info)
{
	lapack_claed7(*n, *cutpnt, *qsiz, *tlvls, *curlvl, *curpbm, d, q, *ldq, *rho, indxq, iwork, rwork, work, qstore, qptr, prmptr, perm, givptr, givcol, givnum, info);
}
