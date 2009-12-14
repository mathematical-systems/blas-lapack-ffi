#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdpoequ_(int* n, double* a, int* lda, double* s, double* scond, double* amax, int* info)
{
	lapack_dpoequ(*n, a, *lda, s, scond, amax, info);
}
