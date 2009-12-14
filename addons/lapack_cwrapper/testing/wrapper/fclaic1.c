#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclaic1_(int* job, int* j, void* x, float* sest, void* w, void* gamma, float* sestpr, void* s, void* c)
{
	lapack_claic1(*job, *j, x, *sest, w, gamma, sestpr, s, c);
}
