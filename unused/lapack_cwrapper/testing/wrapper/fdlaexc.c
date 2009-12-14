#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaexc_(long int* wantq, int* n, double* t, int* ldt, double* q, int* ldq, int* j1, int* n1, int* n2, double* work, int* info)
{
	lapack_dlaexc(*wantq, *n, t, *ldt, q, *ldq, *j1, *n1, *n2, work, info);
}
