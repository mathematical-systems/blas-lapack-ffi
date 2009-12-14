#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzpptri_(char* uplo, int* n, void* ap, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zpptri(uploC, *n, ap, info);
}
