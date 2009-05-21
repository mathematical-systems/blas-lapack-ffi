#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzbdsqr_(char* uplo, int* n, int* ncvt, int* nru, int* ncc, double* d, double* e, void* vt, int* ldvt, void* u, int* ldu, void* c, int* ldc, double* rwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zbdsqr(uploC, *n, *ncvt, *nru, *ncc, d, e, vt, *ldvt, u, *ldu, c, *ldc, rwork, info);
}
