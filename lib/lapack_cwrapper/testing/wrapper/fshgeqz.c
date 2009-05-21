#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fshgeqz_(char* job, char* compq, char* compz, int* n, int* ilo, int* ihi, float* h, int* ldh, float* t, int* ldt, float* alphar, float* alphai, float* beta, float* q, int* ldq, float* z, int* ldz, float* work, int* lwork, int* info)
{
	enum lapack_hseqr_type jobC;
	if (*job=='E') jobC = lapack_eigenvalues;
	else if(*job=='S') jobC = lapack_schur_form;

	else jobC = 0;
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
	lapack_shgeqz(jobC, compqC, compzC, *n, *ilo, *ihi, h, *ldh, t, *ldt, alphar, alphai, beta, q, *ldq, z, *ldz, work, *lwork, info);
}
