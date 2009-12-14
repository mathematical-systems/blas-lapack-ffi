#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdrscl_(int* n, double* sa, double* sx, int* incx)
{
	lapack_drscl(*n, *sa, sx, *incx);
}
