#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaed7_(int* icompq, int* n, int* qsiz, int* tlvls, int* curlvl, int* curpbm, double* d, double* q, int* ldq, int* indxq, double* rho, int* cutpnt, double* qstore, int* qptr, int* prmptr, int* perm, int* givptr, int* givcol, double* givnum, double* work, int* iwork, int* info)
{
	lapack_dlaed7(*icompq, *n, *qsiz, *tlvls, *curlvl, *curpbm, d, q, *ldq, indxq, *rho, *cutpnt, qstore, qptr, prmptr, perm, givptr, givcol, givnum, work, iwork, info);
}
