#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdtgsyl_(char* trans, int* ijob, int* m, int* n, double* a, int* lda, double* b, int* ldb, double* c, int* ldc, double* d, int* ldd, double* e, int* lde, double* f, int* ldf, double* dif, double* scale, double* work, int* lwork, int* iwork, int* info)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_dtgsyl(transC, *ijob, *m, *n, a, *lda, b, *ldb, c, *ldc, d, *ldd, e, *lde, f, *ldf, dif, scale, work, *lwork, iwork, info);
}
