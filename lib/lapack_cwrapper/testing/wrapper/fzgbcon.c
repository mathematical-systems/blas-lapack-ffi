#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgbcon_(char* norm, int* n, int* kl, int* ku, void* ab, int* ldab, int* ipiv, double* anorm, double* rcond, void* work, double* rwork, int* info)
{
	enum lapack_norm_type normC;
	if (*norm=='1' || *norm=='O') normC = lapack_one_norm;
	else if(*norm=='I') normC = lapack_inf_norm;
	else if(*norm=='M') normC = lapack_max_norm;
	else if(*norm=='F') normC = lapack_frobenius_norm;
	else normC = 0;
	lapack_zgbcon(normC, *n, *kl, *ku, ab, *ldab, ipiv, *anorm, rcond, work, rwork, info);
}
