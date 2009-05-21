#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdstegr_(char* jobz, char* range, int* n, double* d, double* e, double* vl, double* vu, int* il, int* iu, double* abstol, int* m, double* w, double* z, int* ldz, int* isuppz, double* work, int* lwork, int* iwork, int* liwork, int* info)
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
	lapack_dstegr(jobzC, rangeC, *n, d, e, *vl, *vu, *il, *iu, *abstol, m, w, z, *ldz, isuppz, work, *lwork, iwork, *liwork, info);
}
