#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcsrscl_(int* n, float* sa, void* sx, int* incx)
{
	lapack_csrscl(*n, *sa, sx, *incx);
}
