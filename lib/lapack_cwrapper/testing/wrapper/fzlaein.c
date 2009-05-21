#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlaein_(long int* rightv, long int* noinit, int* n, void* h, int* ldh, void* w, void* v, void* b, int* ldb, double* rwork, double* eps3, double* smlnum, int* info)
{
	lapack_zlaein(*rightv, *noinit, *n, h, *ldh, w, v, b, *ldb, rwork, *eps3, *smlnum, info);
}
