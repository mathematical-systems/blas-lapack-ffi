#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlaqgb_(int* m, int* n, int* kl, int* ku, void* ab, int* ldab, double* r, double* c, double* rowcnd, double* colcnd, double* amax, char* equed)
{
	lapack_zlaqgb(*m, *n, *kl, *ku, ab, *ldab, r, c, *rowcnd, *colcnd, *amax, equed);
}
