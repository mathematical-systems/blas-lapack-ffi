#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdtrexc_(char* compq, int* n, double* t, int* ldt, double* q, int* ldq, int* ifst, int* ilst, double* work, int* info)
{
	enum lapack_compute_type compqC;
	if (*compq=='N') compqC = lapack_not_compute;
	else if(*compq=='I') compqC = lapack_unitary;
	else if(*compq=='V') compqC = lapack_product;

	else compqC = 0;
	lapack_dtrexc(compqC, *n, t, *ldt, q, *ldq, ifst, ilst, work, info);
}
