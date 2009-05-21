#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgghrd_(char* compq, char* compz, int* n, int* ilo, int* ihi, double* a, int* lda, double* b, int* ldb, double* q, int* ldq, double* z, int* ldz, int* info)
{
	enum lapack_compute_type compqC;
	if (*compq=='N') compqC = lapack_not_compute;
	else if(*compq=='I') compqC = lapack_unitary;
	else if(*compq=='V') compqC = lapack_product;

	else compqC = 0;
	enum lapack_compute_type compzC;
	if (*compz=='N') compzC = lapack_not_compute;
	else if(*compz=='I') compzC = lapack_unitary;
	else if(*compz=='V') compzC = lapack_product;

	else compzC = 0;
	lapack_dgghrd(compqC, compzC, *n, *ilo, *ihi, a, *lda, b, *ldb, q, *ldq, z, *ldz, info);
}
