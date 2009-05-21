#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgbtrf_(int* m, int* n, int* kl, int* ku, double* ab, int* ldab, int* ipiv, int* info)
{
	lapack_dgbtrf(*m, *n, *kl, *ku, ab, *ldab, ipiv, info);
}
