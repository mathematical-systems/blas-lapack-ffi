#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaed1_(int* n, double* d, double* q, int* ldq, int* indxq, double* rho, int* cutpnt, double* work, int* iwork, int* info)
{
	lapack_dlaed1(*n, d, q, *ldq, indxq, *rho, *cutpnt, work, iwork, info);
}
