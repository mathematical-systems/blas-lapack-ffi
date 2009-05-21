#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlacrm_(int* m, int* n, void* a, int* lda, double* b, int* ldb, void* c, int* ldc, double* rwork)
{
	lapack_zlacrm(*m, *n, a, *lda, b, *ldb, c, *ldc, rwork);
}
