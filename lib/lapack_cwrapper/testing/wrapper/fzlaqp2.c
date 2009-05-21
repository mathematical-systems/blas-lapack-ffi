#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlaqp2_(int* m, int* n, int* offset, void* a, int* lda, int* jpvt, void* tau, double* vn1, double* vn2, void* work)
{
	lapack_zlaqp2(*m, *n, *offset, a, *lda, jpvt, tau, vn1, vn2, work);
}
