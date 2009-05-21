#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzupgtr_(char* uplo, int* n, void* ap, void* tau, void* q, int* ldq, void* work, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zupgtr(uploC, *n, ap, tau, q, *ldq, work, info);
}
