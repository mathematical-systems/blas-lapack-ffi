#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsopgtr_(char* uplo, int* n, float* ap, float* tau, float* q, int* ldq, float* work, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_sopgtr(uploC, *n, ap, tau, q, *ldq, work, info);
}
