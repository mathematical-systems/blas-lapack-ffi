#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcheevx_(char* jobz, char* range, char* uplo, int* n, void* a, int* lda, float* vl, float* vu, int* il, int* iu, float* abstol, int* m, float* w, void* z, int* ldz, void* work, int* lwork, float* rwork, int* iwork, int* ifail, int* info)
{
	enum lapack_compute_vectors_type jobzC;
	if (*jobz=='N') jobzC = lapack_no_compute_vectors;
	else if(*jobz=='V') jobzC = lapack_compute_vectors;
	else jobzC = 0;
	enum lapack_range_type rangeC;
	if (*range=='A') rangeC = lapack_range_all;
	else if(*range=='V') rangeC = lapack_interval;
	else if(*range=='I') rangeC = lapack_order;
	else rangeC = 0;
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_cheevx(jobzC, rangeC, uploC, *n, a, *lda, *vl, *vu, *il, *iu, *abstol, m, w, z, *ldz, work, *lwork, rwork, iwork, ifail, info);
}
