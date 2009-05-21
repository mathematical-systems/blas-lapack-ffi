#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlaesy_(void* a, void* b, void* c, void* rt1, void* rt2, void* evscal, void* cs1, void* sn1)
{
	lapack_zlaesy(a, b, c, rt1, rt2, evscal, cs1, sn1);
}
