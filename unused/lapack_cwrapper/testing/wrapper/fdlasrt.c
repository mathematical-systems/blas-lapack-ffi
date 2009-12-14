#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlasrt_(char* id, int* n, double* d, int* info)
{
	enum lapack_sort_type idC;
	if (*id=='I') idC = lapack_increasing_order;
	else if(*id=='D') idC = lapack_decreasing_order;
	else idC = 0;
	lapack_dlasrt(idC, *n, d, info);
}
