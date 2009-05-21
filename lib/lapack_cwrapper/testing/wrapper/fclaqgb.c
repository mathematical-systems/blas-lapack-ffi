#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclaqgb_(int* m, int* n, int* kl, int* ku, void* ab, int* ldab, float* r, float* c, float* rowcnd, float* colcnd, float* amax, char* equed)
{
	lapack_claqgb(*m, *n, *kl, *ku, ab, *ldab, r, c, *rowcnd, *colcnd, *amax, equed);
}
