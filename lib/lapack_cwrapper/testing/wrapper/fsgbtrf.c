#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgbtrf_(int* m, int* n, int* kl, int* ku, float* ab, int* ldab, int* ipiv, int* info)
{
	lapack_sgbtrf(*m, *n, *kl, *ku, ab, *ldab, ipiv, info);
}
