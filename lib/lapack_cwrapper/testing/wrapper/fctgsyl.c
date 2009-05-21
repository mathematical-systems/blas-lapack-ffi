#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fctgsyl_(char* trans, int* ijob, int* m, int* n, void* a, int* lda, void* b, int* ldb, void* c, int* ldc, void* d, int* ldd, void* e, int* lde, void* f, int* ldf, float* dif, float* scale, void* work, int* lwork, int* iwork, int* info)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_ctgsyl(transC, *ijob, *m, *n, a, *lda, b, *ldb, c, *ldc, d, *ldd, e, *lde, f, *ldf, dif, scale, work, *lwork, iwork, info);
}
