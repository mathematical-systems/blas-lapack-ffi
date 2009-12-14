#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsrscl_(int* n, float* sa, float* sx, int* incx)
{
	lapack_srscl(*n, *sa, sx, *incx);
}
