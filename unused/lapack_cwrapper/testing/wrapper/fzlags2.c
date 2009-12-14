#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlags2_(long int* upper, double* a1, void* a2, double* a3, double* b1, void* b2, double* b3, double* csu, void* snu, double* csv, void* snv, double* csq, void* snq)
{
	lapack_zlags2(*upper, *a1, a2, *a3, *b1, b2, *b3, csu, snu, csv, snv, csq, snq);
}
