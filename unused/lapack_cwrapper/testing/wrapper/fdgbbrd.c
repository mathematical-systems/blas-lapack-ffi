#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgbbrd_(char* vect, int* m, int* n, int* ncc, int* kl, int* ku, double* ab, int* ldab, double* d, double* e, double* q, int* ldq, double* pt, int* ldpt, double* c, int* ldc, double* work, int* info)
{
	enum lapack_form_matrices_type vectC;
	if (*vect=='N') vectC = lapack_form_none;
	else if(*vect=='Q') vectC = lapack_form_qm;
	else if(*vect=='P') vectC = lapack_form_pp;
	else if(*vect=='B') vectC = lapack_form_both;
	else vectC = 0;
	lapack_dgbbrd(vectC, *m, *n, *ncc, *kl, *ku, ab, *ldab, d, e, q, *ldq, pt, *ldpt, c, *ldc, work, info);
}
