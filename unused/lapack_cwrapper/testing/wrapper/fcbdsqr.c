#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcbdsqr_(char* uplo, int* n, int* ncvt, int* nru, int* ncc, float* d, float* e, void* vt, int* ldvt, void* u, int* ldu, void* c, int* ldc, float* rwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_cbdsqr(uploC, *n, *ncvt, *nru, *ncc, d, e, vt, *ldvt, u, *ldu, c, *ldc, rwork, info);
}
