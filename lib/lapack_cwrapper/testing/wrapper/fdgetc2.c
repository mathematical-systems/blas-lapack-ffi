#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgetc2_(int* n, double* a, int* lda, int* ipiv, int* jpiv, int* info)
{
	lapack_dgetc2(*n, a, *lda, ipiv, jpiv, info);
}
