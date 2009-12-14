#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fstgsen_(int* ijob, long int* wantq, long int* wantz, long int* select, int* n, float* a, int* lda, float* b, int* ldb, float* alphar, float* alphai, float* beta, float* q, int* ldq, float* z, int* ldz, int* m, float* pl, float* pr, float* dif, float* work, int* lwork, int* iwork, int* liwork, int* info)
{
	lapack_stgsen(*ijob, *wantq, *wantz, select, *n, a, *lda, b, *ldb, alphar, alphai, beta, q, *ldq, z, *ldz, m, pl, pr, dif, work, *lwork, iwork, *liwork, info);
}
