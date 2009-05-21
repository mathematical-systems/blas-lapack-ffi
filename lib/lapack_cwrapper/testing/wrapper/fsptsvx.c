#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsptsvx_(char* fact, int* n, int* nrhs, float* d, float* e, float* df, float* ef, float* b, int* ldb, float* x, int* ldx, float* rcond, float* ferr, float* berr, float* work, int* info)
{
	enum lapack_fact_type factC;
	if (*fact=='F') factC = lapack_fact_f;
	else if(*fact=='N') factC = lapack_fact_n;
	else if(*fact=='E') factC = lapack_fact_e;
	else factC = 0;
	lapack_sptsvx(factC, *n, *nrhs, d, e, df, ef, b, *ldb, x, *ldx, rcond, ferr, berr, work, info);
}
