#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslahqr_(long int* wantt, long int* wantz, int* n, int* ilo, int* ihi, float* h, int* ldh, float* wr, float* wi, int* iloz, int* ihiz, float* z, int* ldz, int* info)
{
	lapack_slahqr(*wantt, *wantz, *n, *ilo, *ihi, h, *ldh, wr, wi, *iloz, *ihiz, z, *ldz, info);
}
