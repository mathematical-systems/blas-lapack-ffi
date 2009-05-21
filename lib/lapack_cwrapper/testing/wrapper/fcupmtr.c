#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcupmtr_(char* side, char* uplo, char* trans, int* m, int* n, void* ap, void* tau, void* c, int* ldc, void* work, int* info)
{
	enum lapack_side_type sideC;
	if (*side=='L') sideC = lapack_left_side;
	else if(*side=='R') sideC = lapack_right_side;
	else sideC = 0;
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_cupmtr(sideC, uploC, transC, *m, *n, ap, tau, c, *ldc, work, info);
}
