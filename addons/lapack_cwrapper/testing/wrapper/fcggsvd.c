#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcggsvd_(char* jobu, char* jobv, char* jobq, int* m, int* n, int* p, int* k, int* l, void* a, int* lda, void* b, int* ldb, float* alpha, float* beta, void* u, int* ldu, void* v, int* ldv, void* q, int* ldq, void* work, float* rwork, int* iwork, int* info)
{
	enum lapack_compute_ortho_type jobuC;
	if (*jobu=='U') jobuC = lapack_compute_ortho_u;
	else if(*jobu=='V') jobuC = lapack_compute_ortho_v;
	else if(*jobu=='Q') jobuC = lapack_compute_ortho_q;
	else if(*jobu=='N') jobuC = lapack_do_not_compute_ortho;
	else jobuC = 0;
	enum lapack_compute_ortho_type jobvC;
	if (*jobv=='U') jobvC = lapack_compute_ortho_u;
	else if(*jobv=='V') jobvC = lapack_compute_ortho_v;
	else if(*jobv=='Q') jobvC = lapack_compute_ortho_q;
	else if(*jobv=='N') jobvC = lapack_do_not_compute_ortho;
	else jobvC = 0;
	enum lapack_compute_ortho_type jobqC;
	if (*jobq=='U') jobqC = lapack_compute_ortho_u;
	else if(*jobq=='V') jobqC = lapack_compute_ortho_v;
	else if(*jobq=='Q') jobqC = lapack_compute_ortho_q;
	else if(*jobq=='N') jobqC = lapack_do_not_compute_ortho;
	else jobqC = 0;
	lapack_cggsvd(jobuC, jobvC, jobqC, *m, *n, *p, k, l, a, *lda, b, *ldb, alpha, beta, u, *ldu, v, *ldv, q, *ldq, work, rwork, iwork, info);
}
