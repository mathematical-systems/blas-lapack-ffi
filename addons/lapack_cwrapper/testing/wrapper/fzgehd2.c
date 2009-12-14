#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgehd2_(int* n, int* ilo, int* ihi, void* a, int* lda, void* tau, void* work, int* info)
{
	lapack_zgehd2(*n, *ilo, *ihi, a, *lda, tau, work, info);
}
