#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgetri_(int* n, double* a, int* lda, int* ipiv, double* work, int* lwork, int* info)
{
	lapack_dgetri(*n, a, *lda, ipiv, work, *lwork, info);
}
