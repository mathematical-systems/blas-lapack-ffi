#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlaed7_(int* n, int* cutpnt, int* qsiz, int* tlvls, int* curlvl, int* curpbm, double* d, void* q, int* ldq, double* rho, int* indxq, int* iwork, double* rwork, void* work, double* qstore, int* qptr, int* prmptr, int* perm, int* givptr, int* givcol, double* givnum, int* info)
{
	lapack_zlaed7(*n, *cutpnt, *qsiz, *tlvls, *curlvl, *curpbm, d, q, *ldq, *rho, indxq, iwork, rwork, work, qstore, qptr, prmptr, perm, givptr, givcol, givnum, info);
}
