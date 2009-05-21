#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzhbtrd_(char* vect, char* uplo, int* n, int* kd, void* ab, int* ldab, double* d, double* e, void* q, int* ldq, void* work, int* info)
{
	enum lapack_form_q_type vectC;
	if (*vect=='N') vectC = lapack_do_not_form_q;
	else if(*vect=='V') vectC = lapack_form_q;
	else if(*vect=='U') vectC = lapack_update_matrix;
	else vectC = 0;
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zhbtrd(vectC, uploC, *n, *kd, ab, *ldab, d, e, q, *ldq, work, info);
}
