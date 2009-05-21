#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaqps_(int* m, int* n, int* offset, int* nb, int* kb, float* a, int* lda, int* jpvt, float* tau, float* vn1, float* vn2, float* auxv, float* f, int* ldf)
{
	lapack_slaqps(*m, *n, *offset, *nb, kb, a, *lda, jpvt, tau, vn1, vn2, auxv, f, *ldf);
}
