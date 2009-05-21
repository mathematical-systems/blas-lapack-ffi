#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdtrsen_(char* job, char* compq, long int* select, int* n, double* t, int* ldt, double* q, int* ldq, double* wr, double* wi, int* m, double* s, double* sep, double* work, int* lwork, int* iwork, int* liwork, int* info)
{
	enum lapack_compute_cond_type jobC;
	if (*job=='E') jobC = lapack_cond_eigenvalues;
	else if(*job=='V') jobC = lapack_cond_eigenvectors;
	else if(*job=='N') jobC = lapack_no_cond;
	else if(*job=='B') jobC = lapack_cond_both;
	else jobC = 0;
	enum lapack_compute_type compqC;
	if (*compq=='N') compqC = lapack_not_compute;
	else if(*compq=='I') compqC = lapack_unitary;
	else if(*compq=='V') compqC = lapack_product;

	else compqC = 0;
	lapack_dtrsen(jobC, compqC, select, *n, t, *ldt, q, *ldq, wr, wi, m, s, sep, work, *lwork, iwork, *liwork, info);
}
