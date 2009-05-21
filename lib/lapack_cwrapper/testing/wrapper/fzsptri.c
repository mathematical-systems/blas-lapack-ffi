#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzsptri_(char* uplo, int* n, void* ap, int* ipiv, void* work, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zsptri(uploC, *n, ap, ipiv, work, info);
}
