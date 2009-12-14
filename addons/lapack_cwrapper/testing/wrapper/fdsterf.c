#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdsterf_(int* n, double* d, double* e, int* info)
{
	lapack_dsterf(*n, d, e, info);
}
