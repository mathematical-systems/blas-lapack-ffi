#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fstgex2_(long int* wantq, long int* wantz, int* n, float* a, int* lda, float* b, int* ldb, float* q, int* ldq, float* z, int* ldz, int* j1, int* n1, int* n2, float* work, int* lwork, int* info)
{
	lapack_stgex2(*wantq, *wantz, *n, a, *lda, b, *ldb, q, *ldq, z, *ldz, *j1, *n1, *n2, work, *lwork, info);
}
