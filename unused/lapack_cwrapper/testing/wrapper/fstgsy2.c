#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fstgsy2_(char* trans, int* ijob, int* m, int* n, float* a, int* lda, float* b, int* ldb, float* c, int* ldc, float* d, int* ldd, float* e, int* lde, float* f, int* ldf, float* scale, float* rdsum, float* rdscal, int* iwork, int* pq, int* info)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_stgsy2(transC, *ijob, *m, *n, a, *lda, b, *ldb, c, *ldc, d, *ldd, e, *lde, f, *ldf, scale, rdsum, rdscal, iwork, pq, info);
}
