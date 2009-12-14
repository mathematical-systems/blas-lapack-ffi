#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzstedc_(char* compz, int* n, double* d, double* e, void* z, int* ldz, void* work, int* lwork, double* rwork, int* lrwork, int* iwork, int* liwork, int* info)
{
	enum lapack_compute_type compzC;
	if (*compz=='N') compzC = lapack_not_compute;
	else if(*compz=='I') compzC = lapack_unitary;
	else if(*compz=='V') compzC = lapack_product;

	else compzC = 0;
	lapack_zstedc(compzC, *n, d, e, z, *ldz, work, *lwork, rwork, *lrwork, iwork, *liwork, info);
}
