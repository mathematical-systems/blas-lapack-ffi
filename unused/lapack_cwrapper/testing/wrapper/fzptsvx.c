#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzptsvx_(char* fact, int* n, int* nrhs, double* d, void* e, double* df, void* ef, void* b, int* ldb, void* x, int* ldx, double* rcond, double* ferr, double* berr, void* work, double* rwork, int* info)
{
	enum lapack_fact_type factC;
	if (*fact=='F') factC = lapack_fact_f;
	else if(*fact=='N') factC = lapack_fact_n;
	else if(*fact=='E') factC = lapack_fact_e;
	else factC = 0;
	lapack_zptsvx(factC, *n, *nrhs, d, e, df, ef, b, *ldb, x, *ldx, rcond, ferr, berr, work, rwork, info);
}
