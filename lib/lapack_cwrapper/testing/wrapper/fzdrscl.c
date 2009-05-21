#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzdrscl_(int* n, double* sa, void* sx, int* incx)
{
	lapack_zdrscl(*n, *sa, sx, *incx);
}
