#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcggesx_(char* jobvsl, char* jobvsr, char* sort, const long int (*selctg) (void*,void*), char* sense, int* n, void* a, int* lda, void* b, int* ldb, int* sdim, void* alpha, void* beta, void* vsl, int* ldvsl, void* vsr, int* ldvsr, float* rconde, float* rcondv, void* work, int* lwork, float* rwork, int* iwork, int* liwork, long int* bwork, int* info)
{
	enum lapack_compute_vectors_type jobvslC;
	if (*jobvsl=='N') jobvslC = lapack_no_compute_vectors;
	else if(*jobvsl=='V') jobvslC = lapack_compute_vectors;
	else jobvslC = 0;
	enum lapack_compute_vectors_type jobvsrC;
	if (*jobvsr=='N') jobvsrC = lapack_no_compute_vectors;
	else if(*jobvsr=='V') jobvsrC = lapack_compute_vectors;
	else jobvsrC = 0;
	enum lapack_ordering_type sortC;
	if (*sort=='S') sortC = lapack_do_order;
	else if(*sort=='N') sortC = lapack_not_order;
	else sortC = 0;
	enum lapack_reciprocal_condition_type senseC;
	if (*sense=='N') senseC = lapack_no_reciprocal;
	else if(*sense=='E') senseC = lapack_average_selected;
	else if(*sense=='V') senseC = lapack_selected_right_subspace;
	else if(*sense=='B') senseC = lapack_both_reciprocal;
	else senseC = 0;
	lapack_cggesx(jobvslC, jobvsrC, sortC, selctg, senseC, *n, a, *lda, b, *ldb, sdim, alpha, beta, vsl, *ldvsl, vsr, *ldvsr, rconde, rcondv, work, *lwork, rwork, iwork, *liwork, bwork, info);
}
