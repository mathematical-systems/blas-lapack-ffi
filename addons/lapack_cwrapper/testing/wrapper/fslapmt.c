#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslapmt_(long int* forwrd, int* m, int* n, float* x, int* ldx, int* k)
{
	lapack_slapmt(*forwrd, *m, *n, x, *ldx, k);
}
