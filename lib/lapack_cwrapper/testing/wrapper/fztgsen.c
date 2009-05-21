#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fztgsen_(int* ijob, long int* wantq, long int* wantz, long int* select, int* n, void* a, int* lda, void* b, int* ldb, void* alpha, void* beta, void* q, int* ldq, void* z, int* ldz, int* m, double* pl, double* pr, double* dif, void* work, int* lwork, int* iwork, int* liwork, int* info)
{
	lapack_ztgsen(*ijob, *wantq, *wantz, select, *n, a, *lda, b, *ldb, alpha, beta, q, *ldq, z, *ldz, m, pl, pr, dif, work, *lwork, iwork, *liwork, info);
}
