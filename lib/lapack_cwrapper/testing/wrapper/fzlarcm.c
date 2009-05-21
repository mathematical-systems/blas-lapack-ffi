#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlarcm_(int* m, int* n, double* a, int* lda, double* b, int* ldb, void* c, int* ldc, double* rwork)
{
	lapack_zlarcm(*m, *n, a, *lda, b, *ldb, c, *ldc, rwork);
}
