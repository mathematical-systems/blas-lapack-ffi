#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzunmbr_(char* vect, char* side, char* trans, int* m, int* n, int* k, void* a, int* lda, void* tau, void* c, int* ldc, void* work, int* lwork, int* info)
{
	enum lapack_form_matrices_type vectC;
	if (*vect=='N') vectC = lapack_form_none;
	else if(*vect=='Q') vectC = lapack_form_qm;
	else if(*vect=='P') vectC = lapack_form_pp;
	else if(*vect=='B') vectC = lapack_form_both;
	else vectC = 0;
	enum lapack_side_type sideC;
	if (*side=='L') sideC = lapack_left_side;
	else if(*side=='R') sideC = lapack_right_side;
	else sideC = 0;
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_zunmbr(vectC, sideC, transC, *m, *n, *k, a, *lda, tau, c, *ldc, work, *lwork, info);
}
