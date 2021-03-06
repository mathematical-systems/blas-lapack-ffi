#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgesvd_(char* jobu, char* jobvt, int* m, int* n, double* a, int* lda, double* s, double* u, int* ldu, double* vt, int* ldvt, double* work, int* lwork, int* info)
{
	enum lapack_compute_svd_type jobuC;
	if (*jobu=='A') jobuC = lapack_all_matrix;
	else if(*jobu=='S') jobuC = lapack_overwritte_u;
	else if(*jobu=='O') jobuC = lapack_overwritte_a;
	else if(*jobu=='N') jobuC = lapack_no_singular_vectors;
	else jobuC = 0;
	enum lapack_compute_svd_type jobvtC;
	if (*jobvt=='A') jobvtC = lapack_all_matrix;
	else if(*jobvt=='S') jobvtC = lapack_overwritte_u;
	else if(*jobvt=='O') jobvtC = lapack_overwritte_a;
	else if(*jobvt=='N') jobvtC = lapack_no_singular_vectors;
	else jobvtC = 0;
	lapack_dgesvd(jobuC, jobvtC, *m, *n, a, *lda, s, u, *ldu, vt, *ldvt, work, *lwork, info);
}
