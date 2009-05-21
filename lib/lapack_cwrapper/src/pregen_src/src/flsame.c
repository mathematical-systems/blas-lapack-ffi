#include "../src/lapack_enum.h"
#include "../src/lapack.h"

void flsame_(long int* output, char* ca, char* cb)
{
	*output = lapack_lsame( ca[0], cb[0]);
}
