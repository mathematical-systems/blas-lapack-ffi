#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fctrexc_(char* compq, int* n, void* t, int* ldt, void* q, int* ldq, int* ifst, int* ilst, int* info)
{
	enum lapack_compute_type compqC;
	if (*compq=='N') compqC = lapack_not_compute;
	else if(*compq=='I') compqC = lapack_unitary;
	else if(*compq=='V') compqC = lapack_product;

	else compqC = 0;
	lapack_ctrexc(compqC, *n, t, *ldt, q, *ldq, *ifst, *ilst, info);
}
