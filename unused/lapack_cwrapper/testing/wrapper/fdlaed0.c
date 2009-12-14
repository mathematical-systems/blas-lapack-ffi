#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaed0_(int* icompq, int* qsiz, int* n, double* d, double* e, double* q, int* ldq, double* qstore, int* ldqs, double* work, int* iwork, int* info)
{
	lapack_dlaed0(*icompq, *qsiz, *n, d, e, q, *ldq, qstore, *ldqs, work, iwork, info);
}
