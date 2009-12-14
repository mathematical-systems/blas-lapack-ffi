#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasdq_(char* uplo, int* sqre, int* n, int* ncvt, int* nru, int* ncc, float* d, float* e, float* vt, int* ldvt, float* u, int* ldu, float* c, int* ldc, float* work, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_slasdq(uploC, *sqre, *n, *ncvt, *nru, *ncc, d, e, vt, *ldvt, u, *ldu, c, *ldc, work, info);
}
