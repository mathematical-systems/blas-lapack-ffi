#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdormhr_(char* side, char* trans, int* m, int* n, int* ilo, int* ihi, double* a, int* lda, double* tau, double* c, int* ldc, double* work, int* lwork, int* info)
{
	enum lapack_side_type sideC;
	if (*side=='L') sideC = lapack_left_side;
	else if(*side=='R') sideC = lapack_right_side;
	else sideC = 0;
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_dormhr(sideC, transC, *m, *n, *ilo, *ihi, a, *lda, tau, c, *ldc, work, *lwork, info);
}
