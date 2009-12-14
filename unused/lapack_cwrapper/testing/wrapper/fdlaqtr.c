#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaqtr_(long int* ltran, long int* lreal, int* n, double* t, int* ldt, double* b, double* w, double* scale, double* x, double* work, int* info)
{
	lapack_dlaqtr(*ltran, *lreal, *n, t, *ldt, b, *w, scale, x, work, info);
}
