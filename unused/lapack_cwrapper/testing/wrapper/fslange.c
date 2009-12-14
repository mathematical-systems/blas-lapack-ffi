#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslange_(float* output, char* norm, int* m, int* n, float* a, int* lda, float* work)
{
	enum lapack_norm_type normC;
	if (*norm=='1' || *norm=='O') normC = lapack_one_norm;
	else if(*norm=='I') normC = lapack_inf_norm;
	else if(*norm=='M') normC = lapack_max_norm;
	else if(*norm=='F') normC = lapack_frobenius_norm;
	else normC = 0;
	*output = lapack_slange( normC, *m, *n, a, *lda, work);
}
