#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclarft_(char* direct, char* storev, int* n, int* k, void* v, int* ldv, void* tau, void* t, int* ldt)
{
	enum lapack_direction_type directC;
	if (*direct=='F') directC = lapack_forward;
	else if(*direct=='B') directC = lapack_backward;
	else directC = 0;
	enum lapack_store_type storevC;
	if (*storev=='C') storevC = lapack_columnwise;
	else if(*storev=='R') storevC = lapack_rowwise;
	else storevC = 0;
	lapack_clarft(directC, storevC, *n, *k, v, *ldv, tau, t, *ldt);
}
