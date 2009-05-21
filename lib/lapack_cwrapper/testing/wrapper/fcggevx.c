#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcggevx_(char* balanc, char* jobvl, char* jobvr, char* sense, int* n, void* a, int* lda, void* b, int* ldb, void* alpha, void* beta, void* vl, int* ldvl, void* vr, int* ldvr, int* ilo, int* ihi, float* lscale, float* rscale, float* abnrm, float* bbnrm, float* rconde, float* rcondv, void* work, int* lwork, float* rwork, int* iwork, long int* bwork, int* info)
{
	enum lapack_balance_type balancC;
	if (*balanc=='N') balancC = lapack_nothing;
	else if(*balanc=='P') balancC = lapack_permute;
	else if(*balanc=='S') balancC = lapack_scale;
	else if(*balanc=='B') balancC = lapack_permute_scale;
	else balancC = 0;
	enum lapack_compute_vectors_type jobvlC;
	if (*jobvl=='N') jobvlC = lapack_no_compute_vectors;
	else if(*jobvl=='V') jobvlC = lapack_compute_vectors;
	else jobvlC = 0;
	enum lapack_compute_vectors_type jobvrC;
	if (*jobvr=='N') jobvrC = lapack_no_compute_vectors;
	else if(*jobvr=='V') jobvrC = lapack_compute_vectors;
	else jobvrC = 0;
	enum lapack_reciprocal_condition_type senseC;
	if (*sense=='N') senseC = lapack_no_reciprocal;
	else if(*sense=='E') senseC = lapack_average_selected;
	else if(*sense=='V') senseC = lapack_selected_right_subspace;
	else if(*sense=='B') senseC = lapack_both_reciprocal;
	else senseC = 0;
	lapack_cggevx(balancC, jobvlC, jobvrC, senseC, *n, a, *lda, b, *ldb, alpha, beta, vl, *ldvl, vr, *ldvr, ilo, ihi, lscale, rscale, abnrm, bbnrm, rconde, rcondv, work, *lwork, rwork, iwork, bwork, info);
}
