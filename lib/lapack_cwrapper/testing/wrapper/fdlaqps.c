#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaqps_(int* m, int* n, int* offset, int* nb, int* kb, double* a, int* lda, int* jpvt, double* tau, double* vn1, double* vn2, double* auxv, double* f, int* ldf)
{
	lapack_dlaqps(*m, *n, *offset, *nb, kb, a, *lda, jpvt, tau, vn1, vn2, auxv, f, *ldf);
}
