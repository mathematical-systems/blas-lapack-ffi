#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzsptrf_(char* uplo, int* n, void* ap, int* ipiv, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zsptrf(uploC, *n, ap, ipiv, info);
}
