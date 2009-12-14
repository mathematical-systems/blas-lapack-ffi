#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclaein_(long int* rightv, long int* noinit, int* n, void* h, int* ldh, void* w, void* v, void* b, int* ldb, float* rwork, float* eps3, float* smlnum, int* info)
{
	lapack_claein(*rightv, *noinit, *n, h, *ldh, w, v, b, *ldb, rwork, *eps3, *smlnum, info);
}
