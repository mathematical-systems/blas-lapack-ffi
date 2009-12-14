#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclaqp2_(int* m, int* n, int* offset, void* a, int* lda, int* jpvt, void* tau, float* vn1, float* vn2, void* work)
{
	lapack_claqp2(*m, *n, *offset, a, *lda, jpvt, tau, vn1, vn2, work);
}
