#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgesdd_(char* jobz, int* m, int* n, void* a, int* lda, float* s, void* u, int* ldu, void* vt, int* ldvt, void* work, int* lwork, float* rwork, int* iwork, int* info)
{
	enum lapack_compute_svd_type jobzC;
	if (*jobz=='A') jobzC = lapack_all_matrix;
	else if(*jobz=='S') jobzC = lapack_overwritte_u;
	else if(*jobz=='O') jobzC = lapack_overwritte_a;
	else if(*jobz=='N') jobzC = lapack_no_singular_vectors;
	else jobzC = 0;
	lapack_cgesdd(jobzC, *m, *n, a, *lda, s, u, *ldu, vt, *ldvt, work, *lwork, rwork, iwork, info);
}
