#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fssterf_(int* n, float* d, float* e, int* info)
{
	lapack_ssterf(*n, d, e, info);
}
