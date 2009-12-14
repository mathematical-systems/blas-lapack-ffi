#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaic1_(int* job, int* j, double* x, double* sest, double* w, double* gamma, double* sestpr, double* s, double* c)
{
	lapack_dlaic1(*job, *j, x, *sest, w, *gamma, sestpr, s, c);
}
