#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fchpgst_(int* itype, char* uplo, int* n, void* ap, void* bp, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_chpgst(*itype, uploC, *n, ap, bp, info);
}
