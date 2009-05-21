#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fssbgvx_(char* jobz, char* range, char* uplo, int* n, int* ka, int* kb, float* ab, int* ldab, float* bb, int* ldbb, float* q, int* ldq, float* vl, float* vu, int* il, int* iu, float* abstol, int* m, float* w, float* z, int* ldz, float* work, int* iwork, int* ifail, int* info)
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
	lapack_ssbgvx(jobzC, rangeC, uploC, *n, *ka, *kb, ab, *ldab, bb, *ldbb, q, *ldq, *vl, *vu, *il, *iu, *abstol, m, w, z, *ldz, work, iwork, ifail, info);
}
