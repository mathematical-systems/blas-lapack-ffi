#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsspgst_(int* itype, char* uplo, int* n, float* ap, float* bp, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_sspgst(*itype, uploC, *n, ap, bp, info);
}
