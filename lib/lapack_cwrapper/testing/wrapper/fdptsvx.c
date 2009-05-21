#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdptsvx_(char* fact, int* n, int* nrhs, double* d, double* e, double* df, double* ef, double* b, int* ldb, double* x, int* ldx, double* rcond, double* ferr, double* berr, double* work, int* info)
{
	enum lapack_fact_type factC;
	if (*fact=='F') factC = lapack_fact_f;
	else if(*fact=='N') factC = lapack_fact_n;
	else if(*fact=='E') factC = lapack_fact_e;
	else factC = 0;
	lapack_dptsvx(factC, *n, *nrhs, d, e, df, ef, b, *ldb, x, *ldx, rcond, ferr, berr, work, info);
}
