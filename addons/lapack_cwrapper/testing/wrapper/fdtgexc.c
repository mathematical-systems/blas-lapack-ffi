#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdtgexc_(long int* wantq, long int* wantz, int* n, double* a, int* lda, double* b, int* ldb, double* q, int* ldq, double* z, int* ldz, int* ifst, int* ilst, double* work, int* lwork, int* info)
{
	lapack_dtgexc(*wantq, *wantz, *n, a, *lda, b, *ldb, q, *ldq, z, *ldz, ifst, ilst, work, *lwork, info);
}
