#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclarcm_(int* m, int* n, float* a, int* lda, float* b, int* ldb, void* c, int* ldc, float* rwork)
{
	lapack_clarcm(*m, *n, a, *lda, b, *ldb, c, *ldc, rwork);
}
