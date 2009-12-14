#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcungbr_(char* vect, int* m, int* n, int* k, void* a, int* lda, void* tau, void* work, int* lwork, int* info)
{
	enum lapack_form_matrices_type vectC;
	if (*vect=='N') vectC = lapack_form_none;
	else if(*vect=='Q') vectC = lapack_form_qm;
	else if(*vect=='P') vectC = lapack_form_pp;
	else if(*vect=='B') vectC = lapack_form_both;
	else vectC = 0;
	lapack_cungbr(vectC, *m, *n, *k, a, *lda, tau, work, *lwork, info);
}
