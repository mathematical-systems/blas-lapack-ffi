#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdtgsen_(int* ijob, long int* wantq, long int* wantz, long int* select, int* n, double* a, int* lda, double* b, int* ldb, double* alphar, double* alphai, double* beta, double* q, int* ldq, double* z, int* ldz, int* m, double* pl, double* pr, double* dif, double* work, int* lwork, int* iwork, int* liwork, int* info)
{
	lapack_dtgsen(*ijob, *wantq, *wantz, select, *n, a, *lda, b, *ldb, alphar, alphai, beta, q, *ldq, z, *ldz, m, pl, pr, dif, work, *lwork, iwork, *liwork, info);
}
