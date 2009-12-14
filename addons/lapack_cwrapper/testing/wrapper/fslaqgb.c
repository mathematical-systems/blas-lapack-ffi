#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaqgb_(int* m, int* n, int* kl, int* ku, float* ab, int* ldab, float* r, float* c, float* rowcnd, float* colcnd, float* amax, char* equed)
{
	lapack_slaqgb(*m, *n, *kl, *ku, ab, *ldab, r, c, *rowcnd, *colcnd, *amax, equed);
}
