#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsstebz_(char* range, char* order, int* n, float* vl, float* vu, int* il, int* iu, float* abstol, float* d, float* e, int* m, int* nsplit, float* w, int* iblock, int* isplit, float* work, int* iwork, int* info)
{
	enum lapack_range_type rangeC;
	if (*range=='A') rangeC = lapack_range_all;
	else if(*range=='V') rangeC = lapack_interval;
	else if(*range=='I') rangeC = lapack_order;
	else rangeC = 0;
	enum lapack_order_block_type orderC;
	if (*order=='B') orderC = lapack_by_block;
	else if(*order=='E') orderC = lapack_matrix;
	else orderC = 0;
	lapack_sstebz(rangeC, orderC, *n, *vl, *vu, *il, *iu, *abstol, d, e, m, nsplit, w, iblock, isplit, work, iwork, info);
}
