#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgetrf_(int* m, int* n, double* a, int* lda, int* ipiv, int* info)
{
	lapack_dgetrf(*m, *n, a, *lda, ipiv, info);
}
