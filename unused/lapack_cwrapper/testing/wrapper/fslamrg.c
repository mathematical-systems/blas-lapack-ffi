#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslamrg_(int* n1, int* n2, float* a, int* strd1, int* strd2, int* index)
{
	lapack_slamrg(*n1, *n2, a, *strd1, *strd2, index);
}
