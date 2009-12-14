#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fctgex2_(long int* wantq, long int* wantz, int* n, void* a, int* lda, void* b, int* ldb, void* q, int* ldq, void* z, int* ldz, int* j1, int* info)
{
	lapack_ctgex2(*wantq, *wantz, *n, a, *lda, b, *ldb, q, *ldq, z, *ldz, *j1, info);
}
