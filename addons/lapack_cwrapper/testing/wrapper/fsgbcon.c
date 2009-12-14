#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgbcon_(char* norm, int* n, int* kl, int* ku, float* ab, int* ldab, int* ipiv, float* anorm, float* rcond, float* work, int* iwork, int* info)
{
	enum lapack_norm_type normC;
	if (*norm=='1' || *norm=='O') normC = lapack_one_norm;
	else if(*norm=='I') normC = lapack_inf_norm;
	else if(*norm=='M') normC = lapack_max_norm;
	else if(*norm=='F') normC = lapack_frobenius_norm;
	else normC = 0;
	lapack_sgbcon(normC, *n, *kl, *ku, ab, *ldab, ipiv, *anorm, rcond, work, iwork, info);
}
