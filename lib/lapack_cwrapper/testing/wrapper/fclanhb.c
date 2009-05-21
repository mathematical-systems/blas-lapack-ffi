#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclanhb_(float* output, char* norm, char* uplo, int* n, int* k, void* ab, int* ldab, float* work)
{
	enum lapack_norm_type normC;
	if (*norm=='1' || *norm=='O') normC = lapack_one_norm;
	else if(*norm=='I') normC = lapack_inf_norm;
	else if(*norm=='M') normC = lapack_max_norm;
	else if(*norm=='F') normC = lapack_frobenius_norm;
	else normC = 0;
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	*output = lapack_clanhb( normC, uploC, *n, *k, ab, *ldab, work);
}
