#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsspsvx_(char* fact, char* uplo, int* n, int* nrhs, float* ap, float* afp, int* ipiv, float* b, int* ldb, float* x, int* ldx, float* rcond, float* ferr, float* berr, float* work, int* iwork, int* info)
{
	enum lapack_fact_type factC;
	if (*fact=='F') factC = lapack_fact_f;
	else if(*fact=='N') factC = lapack_fact_n;
	else if(*fact=='E') factC = lapack_fact_e;
	else factC = 0;
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_sspsvx(factC, uploC, *n, *nrhs, ap, afp, ipiv, b, *ldb, x, *ldx, rcond, ferr, berr, work, iwork, info);
}
