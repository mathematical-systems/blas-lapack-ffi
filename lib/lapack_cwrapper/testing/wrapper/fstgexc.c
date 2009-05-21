#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fstgexc_(long int* wantq, long int* wantz, int* n, float* a, int* lda, float* b, int* ldb, float* q, int* ldq, float* z, int* ldz, int* ifst, int* ilst, float* work, int* lwork, int* info)
{
	lapack_stgexc(*wantq, *wantz, *n, a, *lda, b, *ldb, q, *ldq, z, *ldz, ifst, ilst, work, *lwork, info);
}
