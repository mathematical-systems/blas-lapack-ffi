#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdtrsyl_(char* trana, char* tranb, int* isgn, int* m, int* n, double* a, int* lda, double* b, int* ldb, double* c, int* ldc, double* scale, int* info)
{
	enum lapack_trans_type tranaC;
	if (*trana=='N') tranaC = lapack_no_trans;
	else if(*trana=='T') tranaC = lapack_trans;
	else if(*trana=='C') tranaC = lapack_conj_trans;
	else tranaC = 0;
	enum lapack_trans_type tranbC;
	if (*tranb=='N') tranbC = lapack_no_trans;
	else if(*tranb=='T') tranbC = lapack_trans;
	else if(*tranb=='C') tranbC = lapack_conj_trans;
	else tranbC = 0;
	lapack_dtrsyl(tranaC, tranbC, *isgn, *m, *n, a, *lda, b, *ldb, c, *ldc, scale, info);
}
