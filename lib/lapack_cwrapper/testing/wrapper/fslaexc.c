#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaexc_(long int* wantq, int* n, float* t, int* ldt, float* q, int* ldq, int* j1, int* n1, int* n2, float* work, int* info)
{
	lapack_slaexc(*wantq, *n, t, *ldt, q, *ldq, *j1, *n1, *n2, work, info);
}
