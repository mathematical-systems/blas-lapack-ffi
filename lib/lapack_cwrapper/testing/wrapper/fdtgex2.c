#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdtgex2_(long int* wantq, long int* wantz, int* n, double* a, int* lda, double* b, int* ldb, double* q, int* ldq, double* z, int* ldz, int* j1, int* n1, int* n2, double* work, int* lwork, int* info)
{
	lapack_dtgex2(*wantq, *wantz, *n, a, *lda, b, *ldb, q, *ldq, z, *ldz, *j1, *n1, *n2, work, *lwork, info);
}
