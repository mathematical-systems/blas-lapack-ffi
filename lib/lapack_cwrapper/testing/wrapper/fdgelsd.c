#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgelsd_(int* m, int* n, int* nrhs, double* a, int* lda, double* b, int* ldb, double* s, double* rcond, int* rank, double* work, int* lwork, int* iwork, int* info)
{
	lapack_dgelsd(*m, *n, *nrhs, a, *lda, b, *ldb, s, *rcond, rank, work, *lwork, iwork, info);
}
