#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlags2_(long int* upper, double* a1, double* a2, double* a3, double* b1, double* b2, double* b3, double* csu, double* snu, double* csv, double* snv, double* csq, double* snq)
{
	lapack_dlags2(*upper, *a1, *a2, *a3, *b1, *b2, *b3, csu, snu, csv, snv, csq, snq);
}
