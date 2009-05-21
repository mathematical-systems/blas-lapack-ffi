#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcptsvx_(char* fact, int* n, int* nrhs, float* d, void* e, float* df, void* ef, void* b, int* ldb, void* x, int* ldx, float* rcond, float* ferr, float* berr, void* work, float* rwork, int* info)
{
	enum lapack_fact_type factC;
	if (*fact=='F') factC = lapack_fact_f;
	else if(*fact=='N') factC = lapack_fact_n;
	else if(*fact=='E') factC = lapack_fact_e;
	else factC = 0;
	lapack_cptsvx(factC, *n, *nrhs, d, e, df, ef, b, *ldb, x, *ldx, rcond, ferr, berr, work, rwork, info);
}
