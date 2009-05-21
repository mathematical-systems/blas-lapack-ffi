#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzhbevx_(char* jobz, char* range, char* uplo, int* n, int* kd, void* ab, int* ldab, void* q, int* ldq, double* vl, double* vu, int* il, int* iu, double* abstol, int* m, double* w, void* z, int* ldz, void* work, double* rwork, int* iwork, int* ifail, int* info)
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
	lapack_zhbevx(jobzC, rangeC, uploC, *n, *kd, ab, *ldab, q, *ldq, *vl, *vu, *il, *iu, *abstol, m, w, z, *ldz, work, rwork, iwork, ifail, info);
}
