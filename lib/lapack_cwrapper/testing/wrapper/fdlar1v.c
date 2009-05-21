#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlar1v_(int* n, int* b1, int* bn, double* sigma, double* l, double* d, double* ld, double* lld, double* gersch, double* z, double* ztz, double* mingma, int* r, int* isuppz, double* work)
{
	lapack_dlar1v(*n, *b1, *bn, *sigma, l, d, ld, lld, gersch, z, ztz, mingma, r, isuppz, work);
}
