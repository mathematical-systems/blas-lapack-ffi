/*
** lapack_wrapper.c
** 
** Made by (Jianshi Huang)
** Login   <huang@allegro>
** 
** Started on  Tue May 19 19:08:24 2009 Jianshi Huang
** Last update Sun May 12 01:17:25 2002 Speed Blue
*/

#include "lapack_wrapper.h"

void my_dgemm(char transA,
	      char transB,
	      MKL_INT m,
	      MKL_INT n,
	      MKL_INT k,
	      double alpha,
	      double* a,
	      MKL_INT lda,
	      double* b,
	      MKL_INT ldb,
	      double beta,
	      double* c,
	      MKL_INT ldc)
{
  dgemm(&transA, &transB, &m, &n, &k, &alpha, a, &lda, b, &ldb, &beta, c, &ldc);
}
