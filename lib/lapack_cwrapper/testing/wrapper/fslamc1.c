#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslamc1_(int* beta, int* t, long int* rnd, long int* ieee1)
{
	lapack_slamc1(beta, t, rnd, ieee1);
}
