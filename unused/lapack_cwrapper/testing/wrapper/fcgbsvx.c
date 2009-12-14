#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgbsvx_(char* fact, char* trans, int* n, int* kl, int* ku, int* nrhs, void* ab, int* ldab, void* afb, int* ldafb, int* ipiv, char* equed, float* r, float* c, void* b, int* ldb, void* x, int* ldx, float* rcond, float* ferr, float* berr, void* work, float* rwork, int* info)
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
	lapack_cgbsvx(factC, transC, *n, *kl, *ku, *nrhs, ab, *ldab, afb, *ldafb, ipiv, equed, r, c, b, *ldb, x, *ldx, rcond, ferr, berr, work, rwork, info);
}
