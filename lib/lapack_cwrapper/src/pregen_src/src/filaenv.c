#include "../src/lapack_enum.h"
#include "../src/lapack.h"
void filaenv_(int* output, int* ispec, char* name, char* opts, int* n1, int* n2, int* n3, int* n4)
{
	*output = lapack_ilaenv( *ispec, name, opts, *n1, *n2, *n3, *n4);
}
