#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdggevx_(char* balanc, char* jobvl, char* jobvr, char* sense, int* n, double* a, int* lda, double* b, int* ldb, double* alphar, double* alphai, double* beta, double* vl, int* ldvl, double* vr, int* ldvr, int* ilo, int* ihi, double* lscale, double* rscale, double* abnrm, double* bbnrm, double* rconde, double* rcondv, double* work, int* lwork, int* iwork, long int* bwork, int* info)
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
	lapack_dggevx(balancC, jobvlC, jobvrC, senseC, *n, a, *lda, b, *ldb, alphar, alphai, beta, vl, *ldvl, vr, *ldvr, ilo, ihi, lscale, rscale, abnrm, bbnrm, rconde, rcondv, work, *lwork, iwork, bwork, info);
}
