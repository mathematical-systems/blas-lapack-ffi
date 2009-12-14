#include "../src/lapack_enum.h"
#include "../src/lapack.h"

void flsamen_(long int* output, int* n, char* ca, char* cb)
{
	*output = lapack_lsamen( *n, ca, cb);
}
