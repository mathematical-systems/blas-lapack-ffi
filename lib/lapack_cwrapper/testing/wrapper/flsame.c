#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void flsame_(long int* output, char* ca, char* cb)
{
	*output = lapack_lsame( ca, cb);
}
