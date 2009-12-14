#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgbtf2_(int* m, int* n, int* kl, int* ku, void* ab, int* ldab, int* ipiv, int* info)
{
	lapack_zgbtf2(*m, *n, *kl, *ku, ab, *ldab, ipiv, info);
}
