#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclacrm_(int* m, int* n, void* a, int* lda, float* b, int* ldb, void* c, int* ldc, float* rwork)
{
	lapack_clacrm(*m, *n, a, *lda, b, *ldb, c, *ldc, rwork);
}
