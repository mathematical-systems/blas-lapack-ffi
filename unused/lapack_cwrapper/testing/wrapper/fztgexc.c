#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fztgexc_(long int* wantq, long int* wantz, int* n, void* a, int* lda, void* b, int* ldb, void* q, int* ldq, void* z, int* ldz, int* ifst, int* ilst, int* info)
{
	lapack_ztgexc(*wantq, *wantz, *n, a, *lda, b, *ldb, q, *ldq, z, *ldz, *ifst, ilst, info);
}
