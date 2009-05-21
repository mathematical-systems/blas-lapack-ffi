#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlaed0_(int* qsiz, int* n, double* d, double* e, void* q, int* ldq, int* iwork, double* rwork, void* qstore, int* ldqs, int* info)
{
	lapack_zlaed0(*qsiz, *n, d, e, q, *ldq, iwork, rwork, qstore, *ldqs, info);
}
