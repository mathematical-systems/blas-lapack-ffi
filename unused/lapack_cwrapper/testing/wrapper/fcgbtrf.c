#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgbtrf_(int* m, int* n, int* kl, int* ku, void* ab, int* ldab, int* ipiv, int* info)
{
	lapack_cgbtrf(*m, *n, *kl, *ku, ab, *ldab, ipiv, info);
}
