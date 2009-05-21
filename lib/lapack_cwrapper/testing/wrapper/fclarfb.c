#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclarfb_(char* side, char* trans, char* direct, char* storev, int* m, int* n, int* k, void* v, int* ldv, void* t, int* ldt, void* c, int* ldc, void* work, int* ldwork)
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
	enum lapack_direction_type directC;
	if (*direct=='F') directC = lapack_forward;
	else if(*direct=='B') directC = lapack_backward;
	else directC = 0;
	enum lapack_store_type storevC;
	if (*storev=='C') storevC = lapack_columnwise;
	else if(*storev=='R') storevC = lapack_rowwise;
	else storevC = 0;
	lapack_clarfb(sideC, transC, directC, storevC, *m, *n, *k, v, *ldv, t, *ldt, c, *ldc, work, *ldwork);
}
