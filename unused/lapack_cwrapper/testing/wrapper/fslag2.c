#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslag2_(float* a, int* lda, float* b, int* ldb, float* safmin, float* scale1, float* scale2, float* wr1, float* wr2, float* wi)
{
	lapack_slag2(a, *lda, b, *ldb, *safmin, scale1, scale2, wr1, wr2, wi);
}
