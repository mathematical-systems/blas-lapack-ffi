#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzpoequ_(int* n, void* a, int* lda, double* s, double* scond, double* amax, int* info)
{
	lapack_zpoequ(*n, a, *lda, s, scond, amax, info);
}
