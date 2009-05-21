#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgtcon_(char* norm, int* n, void* dl, void* d, void* du, void* du2, int* ipiv, double* anorm, double* rcond, void* work, int* info)
{
	enum lapack_norm_type normC;
	if (*norm=='1' || *norm=='O') normC = lapack_one_norm;
	else if(*norm=='I') normC = lapack_inf_norm;
	else if(*norm=='M') normC = lapack_max_norm;
	else if(*norm=='F') normC = lapack_frobenius_norm;
	else normC = 0;
	lapack_zgtcon(normC, *n, dl, d, du, du2, ipiv, *anorm, rcond, work, info);
}
