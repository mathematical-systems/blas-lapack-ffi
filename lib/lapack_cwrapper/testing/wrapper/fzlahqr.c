#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlahqr_(long int* wantt, long int* wantz, int* n, int* ilo, int* ihi, void* h, int* ldh, void* w, int* iloz, int* ihiz, void* z, int* ldz, int* info)
{
	lapack_zlahqr(*wantt, *wantz, *n, *ilo, *ihi, h, *ldh, w, *iloz, *ihiz, z, *ldz, info);
}
