#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgbtf2_(int* m, int* n, int* kl, int* ku, double* ab, int* ldab, int* ipiv, int* info)
{
	lapack_dgbtf2(*m, *n, *kl, *ku, ab, *ldab, ipiv, info);
}
