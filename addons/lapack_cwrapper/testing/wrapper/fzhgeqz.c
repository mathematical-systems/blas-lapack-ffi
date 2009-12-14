#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzhgeqz_(char* job, char* compq, char* compz, int* n, int* ilo, int* ihi, void* h, int* ldh, void* t, int* ldt, void* alpha, void* beta, void* q, int* ldq, void* z, int* ldz, void* work, int* lwork, double* rwork, int* info)
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
	lapack_zhgeqz(jobC, compqC, compzC, *n, *ilo, *ihi, h, *ldh, t, *ldt, alpha, beta, q, *ldq, z, *ldz, work, *lwork, rwork, info);
}
