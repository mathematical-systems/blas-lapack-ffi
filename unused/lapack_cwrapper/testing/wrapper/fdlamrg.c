#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlamrg_(int* n1, int* n2, double* a, int* dtrd1, int* dtrd2, int* index)
{
	lapack_dlamrg(*n1, *n2, a, *dtrd1, *dtrd2, index);
}
