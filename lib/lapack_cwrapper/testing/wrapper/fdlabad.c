#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlabad_(double* small, double* large)
{
	lapack_dlabad(small, large);
}
