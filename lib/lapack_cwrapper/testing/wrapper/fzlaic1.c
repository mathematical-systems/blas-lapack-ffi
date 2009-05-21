#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlaic1_(int* job, int* j, void* x, double* sest, void* w, void* gamma, double* sestpr, void* s, void* c)
{
	lapack_zlaic1(*job, *j, x, *sest, w, gamma, sestpr, s, c);
}
