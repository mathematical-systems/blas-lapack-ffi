#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlalsd_(char* uplo, int* smlsiz, int* n, int* nrhs, double* d, double* e, double* b, int* ldb, double* rcond, int* rank, double* work, int* iwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dlalsd(uploC, *smlsiz, *n, *nrhs, d, e, b, *ldb, *rcond, rank, work, iwork, info);
}
