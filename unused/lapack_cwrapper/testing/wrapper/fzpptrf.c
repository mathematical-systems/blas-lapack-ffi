#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzpptrf_(char* uplo, int* n, void* ap, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zpptrf(uploC, *n, ap, info);
}
