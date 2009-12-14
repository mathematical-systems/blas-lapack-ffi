#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclags2_(long int* upper, float* a1, void* a2, float* a3, float* b1, void* b2, float* b3, float* csu, void* snu, float* csv, void* snv, float* csq, void* snq)
{
	lapack_clags2(*upper, *a1, a2, *a3, *b1, b2, *b3, csu, snu, csv, snv, csq, snq);
}
