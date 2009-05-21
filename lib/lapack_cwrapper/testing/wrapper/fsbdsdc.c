#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsbdsdc_(char* uplo, char* compq, int* n, float* d, float* e, float* u, int* ldu, float* vt, int* ldvt, float* q, int* iq, float* work, int* iwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	enum lapack_compute_type compqC;
	if (*compq=='N') compqC = lapack_not_compute;
	else if(*compq=='I') compqC = lapack_unitary;
	else if(*compq=='V') compqC = lapack_product;

	else compqC = 0;
	lapack_sbdsdc(uploC, compqC, *n, d, e, u, *ldu, vt, *ldvt, q, iq, work, iwork, info);
}
