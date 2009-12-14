#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclapmt_(long int* forwrd, int* m, int* n, void* x, int* ldx, int* k)
{
	lapack_clapmt(*forwrd, *m, *n, x, *ldx, k);
}
