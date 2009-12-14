#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclaed0_(int* qsiz, int* n, float* d, float* e, void* q, int* ldq, int* iwork, float* rwork, void* qstore, int* ldqs, int* info)
{
	lapack_claed0(*qsiz, *n, d, e, q, *ldq, iwork, rwork, qstore, *ldqs, info);
}
