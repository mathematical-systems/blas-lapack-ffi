#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaed0_(int* icompq, int* qsiz, int* n, float* d, float* e, float* q, int* ldq, float* qstore, int* ldqs, float* work, int* iwork, int* info)
{
	lapack_slaed0(*icompq, *qsiz, *n, d, e, q, *ldq, qstore, *ldqs, work, iwork, info);
}
