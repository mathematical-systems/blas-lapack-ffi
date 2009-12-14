#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlapmt_(long int* forwrd, int* m, int* n, double* x, int* ldx, int* k)
{
	lapack_dlapmt(*forwrd, *m, *n, x, *ldx, k);
}
