#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void filaver_(int* vers_major, int* vers_minor, int* vers_patch)
{
	lapack_ilaver(vers_major, vers_minor, vers_patch);
}
