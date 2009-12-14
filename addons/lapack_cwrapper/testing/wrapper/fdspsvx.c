#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdspsvx_(char* fact, char* uplo, int* n, int* nrhs, double* ap, double* afp, int* ipiv, double* b, int* ldb, double* x, int* ldx, double* rcond, double* ferr, double* berr, double* work, int* iwork, int* info)
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
	lapack_dspsvx(factC, uploC, *n, *nrhs, ap, afp, ipiv, b, *ldb, x, *ldx, rcond, ferr, berr, work, iwork, info);
}
