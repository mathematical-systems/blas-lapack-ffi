#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlaqps_(int* m, int* n, int* offset, int* nb, int* kb, void* a, int* lda, int* jpvt, void* tau, double* vn1, double* vn2, void* auxv, void* f, int* ldf)
{
	lapack_zlaqps(*m, *n, *offset, *nb, kb, a, *lda, jpvt, tau, vn1, vn2, auxv, f, *ldf);
}
