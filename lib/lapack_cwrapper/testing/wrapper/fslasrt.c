#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasrt_(char* id, int* n, float* d, int* info)
{
	enum lapack_sort_type idC;
	if (*id=='I') idC = lapack_increasing_order;
	else if(*id=='D') idC = lapack_decreasing_order;
	else idC = 0;
	lapack_slasrt(idC, *n, d, info);
}
