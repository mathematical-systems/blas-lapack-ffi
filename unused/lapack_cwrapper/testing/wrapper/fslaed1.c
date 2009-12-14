#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaed1_(int* n, float* d, float* q, int* ldq, int* indxq, float* rho, int* cutpnt, float* work, int* iwork, int* info)
{
	lapack_slaed1(*n, d, q, *ldq, indxq, *rho, *cutpnt, work, iwork, info);
}
