#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclaqps_(int* m, int* n, int* offset, int* nb, int* kb, void* a, int* lda, int* jpvt, void* tau, float* vn1, float* vn2, void* auxv, void* f, int* ldf)
{
	lapack_claqps(*m, *n, *offset, *nb, kb, a, *lda, jpvt, tau, vn1, vn2, auxv, f, *ldf);
}
