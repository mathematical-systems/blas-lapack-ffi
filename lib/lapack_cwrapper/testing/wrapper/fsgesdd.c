#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgesdd_(char* jobz, int* m, int* n, float* a, int* lda, float* s, float* u, int* ldu, float* vt, int* ldvt, float* work, int* lwork, int* iwork, int* info)
{
	enum lapack_compute_svd_type jobzC;
	if (*jobz=='A') jobzC = lapack_all_matrix;
	else if(*jobz=='S') jobzC = lapack_overwritte_u;
	else if(*jobz=='O') jobzC = lapack_overwritte_a;
	else if(*jobz=='N') jobzC = lapack_no_singular_vectors;
	else jobzC = 0;
	lapack_sgesdd(jobzC, *m, *n, a, *lda, s, u, *ldu, vt, *ldvt, work, *lwork, iwork, info);
}
