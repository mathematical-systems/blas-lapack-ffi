#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgtsvx_(char* fact, char* trans, int* n, int* nrhs, void* dl, void* d, void* du, void* dlf, void* df, void* duf, void* du2, int* ipiv, void* b, int* ldb, void* x, int* ldx, float* rcond, float* ferr, float* berr, void* work, float* rwork, int* info)
{
	enum lapack_fact_type factC;
	if (*fact=='F') factC = lapack_fact_f;
	else if(*fact=='N') factC = lapack_fact_n;
	else if(*fact=='E') factC = lapack_fact_e;
	else factC = 0;
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_cgtsvx(factC, transC, *n, *nrhs, dl, d, du, dlf, df, duf, du2, ipiv, b, *ldb, x, *ldx, rcond, ferr, berr, work, rwork, info);
}
