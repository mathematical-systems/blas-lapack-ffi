#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzggsvp_(char* jobu, char* jobv, char* jobq, int* m, int* p, int* n, void* a, int* lda, void* b, int* ldb, double* tola, double* tolb, int* k, int* l, void* u, int* ldu, void* v, int* ldv, void* q, int* ldq, int* iwork, double* rwork, void* tau, void* work, int* info)
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
	lapack_zggsvp(jobuC, jobvC, jobqC, *m, *p, *n, a, *lda, b, *ldb, *tola, *tolb, k, l, u, *ldu, v, *ldv, q, *ldq, iwork, rwork, tau, work, info);
}
