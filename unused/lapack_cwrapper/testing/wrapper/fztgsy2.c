#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fztgsy2_(char* trans, int* ijob, int* m, int* n, void* a, int* lda, void* b, int* ldb, void* c, int* ldc, void* d, int* ldd, void* e, int* lde, void* f, int* ldf, double* scale, double* rdsum, double* rdscal, int* info)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_ztgsy2(transC, *ijob, *m, *n, a, *lda, b, *ldb, c, *ldc, d, *ldd, e, *lde, f, *ldf, scale, rdsum, rdscal, info);
}
