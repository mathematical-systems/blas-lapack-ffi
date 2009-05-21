#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgetf2_(int* m, int* n, double* a, int* lda, int* ipiv, int* info)
{
	lapack_dgetf2(*m, *n, a, *lda, ipiv, info);
}
