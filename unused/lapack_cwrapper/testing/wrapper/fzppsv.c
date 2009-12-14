#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzppsv_(char* uplo, int* n, int* nrhs, void* ap, void* b, int* ldb, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zppsv(uploC, *n, *nrhs, ap, b, *ldb, info);
}
