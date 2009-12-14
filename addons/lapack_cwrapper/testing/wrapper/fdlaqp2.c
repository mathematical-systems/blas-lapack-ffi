#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaqp2_(int* m, int* n, int* offset, double* a, int* lda, int* jpvt, double* tau, double* vn1, double* vn2, double* work)
{
	lapack_dlaqp2(*m, *n, *offset, a, *lda, jpvt, tau, vn1, vn2, work);
}
