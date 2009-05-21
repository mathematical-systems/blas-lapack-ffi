#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlag2_(double* a, int* lda, double* b, int* ldb, double* safmin, double* scale1, double* scale2, double* wr1, double* wr2, double* wi)
{
	lapack_dlag2(a, *lda, b, *ldb, *safmin, scale1, scale2, wr1, wr2, wi);
}
