#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgesvx_(char* fact, char* trans, int* n, int* nrhs, float* a, int* lda, float* af, int* ldaf, int* ipiv, char* equed, float* r, float* c, float* b, int* ldb, float* x, int* ldx, float* rcond, float* ferr, float* berr, float* work, int* iwork, int* info)
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
	lapack_sgesvx(factC, transC, *n, *nrhs, a, *lda, af, *ldaf, ipiv, equed, r, c, b, *ldb, x, *ldx, rcond, ferr, berr, work, iwork, info);
}
