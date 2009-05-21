#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsstedc_(char* compz, int* n, float* d, float* e, float* z, int* ldz, float* work, int* lwork, int* iwork, int* liwork, int* info)
{
	enum lapack_compute_type compzC;
	if (*compz=='N') compzC = lapack_not_compute;
	else if(*compz=='I') compzC = lapack_unitary;
	else if(*compz=='V') compzC = lapack_product;

	else compzC = 0;
	lapack_sstedc(compzC, *n, d, e, z, *ldz, work, *lwork, iwork, *liwork, info);
}
