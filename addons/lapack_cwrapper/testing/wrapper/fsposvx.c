#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsposvx_(char* fact, char* uplo, int* n, int* nrhs, float* a, int* lda, float* af, int* ldaf, char* equed, float* s, float* b, int* ldb, float* x, int* ldx, float* rcond, float* ferr, float* berr, float* work, int* iwork, int* info)
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
	lapack_sposvx(factC, uploC, *n, *nrhs, a, *lda, af, *ldaf, equed, s, b, *ldb, x, *ldx, rcond, ferr, berr, work, iwork, info);
}
