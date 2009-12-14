#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcpoequ_(int* n, void* a, int* lda, float* s, float* scond, float* amax, int* info)
{
	lapack_cpoequ(*n, a, *lda, s, scond, amax, info);
}
