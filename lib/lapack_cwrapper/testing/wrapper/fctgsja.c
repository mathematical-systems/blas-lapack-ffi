#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fctgsja_(char* jobu, char* jobv, char* jobq, int* m, int* p, int* n, int* k, int* l, void* a, int* lda, void* b, int* ldb, float* tola, float* tolb, float* alpha, float* beta, void* u, int* ldu, void* v, int* ldv, void* q, int* ldq, void* work, int* ncycle, int* info)
{
	enum lapack_compute_tgsj_type jobuC;
	if (*jobu=='U') jobuC = lapack_ortho_u;
	else if (*jobu=='V') jobuC = lapack_ortho_v;
	else if (*jobu=='Q') jobuC = lapack_ortho_q;
	else if (*jobu=='I') jobuC = lapack_unit;
	else if (*jobu=='N') jobuC = lapack_do_not_compute;
	else jobuC = 0;
	enum lapack_compute_tgsj_type jobvC;
	if (*jobv=='U') jobvC = lapack_ortho_u;
	else if (*jobv=='V') jobvC = lapack_ortho_v;
	else if (*jobv=='Q') jobvC = lapack_ortho_q;
	else if (*jobv=='I') jobvC = lapack_unit;
	else if (*jobv=='N') jobvC = lapack_do_not_compute;
	else jobvC = 0;
	enum lapack_compute_tgsj_type jobqC;
	if (*jobq=='U') jobqC = lapack_ortho_u;
	else if (*jobq=='V') jobqC = lapack_ortho_v;
	else if (*jobq=='Q') jobqC = lapack_ortho_q;
	else if (*jobq=='I') jobqC = lapack_unit;
	else if (*jobq=='N') jobqC = lapack_do_not_compute;
	else jobqC = 0;
	lapack_ctgsja(jobuC, jobvC, jobqC, *m, *p, *n, *k, *l, a, *lda, b, *ldb, *tola, *tolb, alpha, beta, u, *ldu, v, *ldv, q, *ldq, work, ncycle, info);
}
