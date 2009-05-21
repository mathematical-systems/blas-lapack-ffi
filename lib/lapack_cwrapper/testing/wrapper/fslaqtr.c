#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaqtr_(long int* ltran, long int* lreal, int* n, float* t, int* ldt, float* b, float* w, float* scale, float* x, float* work, int* info)
{
	lapack_slaqtr(*ltran, *lreal, *n, t, *ldt, b, *w, scale, x, work, info);
}
