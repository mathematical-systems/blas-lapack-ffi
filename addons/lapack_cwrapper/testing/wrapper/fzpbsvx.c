#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzpbsvx_(char* fact, char* uplo, int* n, int* kd, int* nrhs, void* ab, int* ldab, void* afb, int* ldafb, char* equed, double* s, void* b, int* ldb, void* x, int* ldx, double* rcond, double* ferr, double* berr, void* work, double* rwork, int* info)
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
	lapack_zpbsvx(factC, uploC, *n, *kd, *nrhs, ab, *ldab, afb, *ldafb, equed, s, b, *ldb, x, *ldx, rcond, ferr, berr, work, rwork, info);
}
