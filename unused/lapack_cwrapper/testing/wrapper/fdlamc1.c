#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlamc1_(int* beta, int* t, long int* rnd, long int* ieee1)
{
	lapack_dlamc1(beta, t, rnd, ieee1);
}
