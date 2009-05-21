#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fxerbla_(char* srname, int* info)
{
	lapack_xerbla(srname, *info);
}
