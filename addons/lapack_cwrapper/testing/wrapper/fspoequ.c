#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fspoequ_(int* n, float* a, int* lda, float* s, float* scond, float* amax, int* info)
{
	lapack_spoequ(*n, a, *lda, s, scond, amax, info);
}
