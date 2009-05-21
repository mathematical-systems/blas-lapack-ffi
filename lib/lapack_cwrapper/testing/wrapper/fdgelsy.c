#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgelsy_(int* m, int* n, int* nrhs, double* a, int* lda, double* b, int* ldb, int* jpvt, double* rcond, int* rank, double* work, int* lwork, int* info)
{
	lapack_dgelsy(*m, *n, *nrhs, a, *lda, b, *ldb, jpvt, *rcond, rank, work, *lwork, info);
}
