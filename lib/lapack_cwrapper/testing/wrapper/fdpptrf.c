#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdpptrf_(char* uplo, int* n, double* ap, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dpptrf(uploC, *n, ap, info);
}
