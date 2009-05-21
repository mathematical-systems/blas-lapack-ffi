#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaqp2_(int* m, int* n, int* offset, float* a, int* lda, int* jpvt, float* tau, float* vn1, float* vn2, float* work)
{
	lapack_slaqp2(*m, *n, *offset, a, *lda, jpvt, tau, vn1, vn2, work);
}
