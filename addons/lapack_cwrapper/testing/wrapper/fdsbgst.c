#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdsbgst_(char* vect, char* uplo, int* n, int* ka, int* kb, double* ab, int* ldab, double* bb, int* ldbb, double* x, int* ldx, double* work, int* info)
{
	enum lapack_form_x_type vectC;
	if (*vect=='N') vectC = lapack_do_not_form_x;
	else if(*vect=='V') vectC = lapack_form_x;
	else vectC = 0;
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dsbgst(vectC, uploC, *n, *ka, *kb, ab, *ldab, bb, *ldbb, x, *ldx, work, info);
}
