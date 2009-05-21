#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdopgtr_(char* uplo, int* n, double* ap, double* tau, double* q, int* ldq, double* work, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dopgtr(uploC, *n, ap, tau, q, *ldq, work, info);
}
