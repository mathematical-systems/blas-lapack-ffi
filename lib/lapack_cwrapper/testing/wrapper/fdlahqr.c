#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlahqr_(long int* wantt, long int* wantz, int* n, int* ilo, int* ihi, double* h, int* ldh, double* wr, double* wi, int* iloz, int* ihiz, double* z, int* ldz, int* info)
{
	lapack_dlahqr(*wantt, *wantz, *n, *ilo, *ihi, h, *ldh, wr, wi, *iloz, *ihiz, z, *ldz, info);
}
