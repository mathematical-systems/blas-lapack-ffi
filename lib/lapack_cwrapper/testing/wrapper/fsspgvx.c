#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsspgvx_(int* itype, char* jobz, char* range, char* uplo, int* n, float* ap, float* bp, float* vl, float* vu, int* il, int* iu, float* abstol, int* m, float* w, float* z, int* ldz, float* work, int* iwork, int* ifail, int* info)
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
	lapack_sspgvx(*itype, jobzC, rangeC, uploC, *n, ap, bp, *vl, *vu, *il, *iu, *abstol, m, w, z, *ldz, work, iwork, ifail, info);
}
