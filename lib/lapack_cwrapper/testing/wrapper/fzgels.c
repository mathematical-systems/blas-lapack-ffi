#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgels_(char* trans, int* m, int* n, int* nrhs, void* a, int* lda, void* b, int* ldb, void* work, int* lwork, int* info)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_zgels(transC, *m, *n, *nrhs, a, *lda, b, *ldb, work, *lwork, info);
}
