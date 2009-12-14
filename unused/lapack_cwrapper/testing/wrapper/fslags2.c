#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslags2_(long int* upper, float* a1, float* a2, float* a3, float* b1, float* b2, float* b3, float* csu, float* snu, float* csv, float* snv, float* csq, float* snq)
{
	lapack_slags2(*upper, *a1, *a2, *a3, *b1, *b2, *b3, csu, snu, csv, snv, csq, snq);
}
