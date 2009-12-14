#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaic1_(int* job, int* j, float* x, float* sest, float* w, float* gamma, float* sestpr, float* s, float* c)
{
	lapack_slaic1(*job, *j, x, *sest, w, *gamma, sestpr, s, c);
}
