#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdhseqr_(char* job, char* compz, int* n, int* ilo, int* ihi, double* h, int* ldh, double* wr, double* wi, double* z, int* ldz, double* work, int* lwork, int* info)
{
	enum lapack_hseqr_type jobC;
	if (*job=='E') jobC = lapack_eigenvalues;
	else if(*job=='S') jobC = lapack_schur_form;

	else jobC = 0;
	enum lapack_compute_type compzC;
	if (*compz=='N') compzC = lapack_not_compute;
	else if(*compz=='I') compzC = lapack_unitary;
	else if(*compz=='V') compzC = lapack_product;

	else compzC = 0;
	lapack_dhseqr(jobC, compzC, *n, *ilo, *ihi, h, *ldh, wr, wi, z, *ldz, work, *lwork, info);
}
