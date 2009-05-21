/*
** lapack_wrapper.h
** 
** Made by Jianshi Huang
** Login   <huang@allegro>
** 
** Started on  Tue May 19 19:08:55 2009 Jianshi Huang
** Last update Tue May 19 19:08:55 2009 Jianshi Huang
*/

#ifndef   	LAPACK_WRAPPER_H_
# define   	LAPACK_WRAPPER_H_

#include <mkl_blas.h>

extern void my_dgemm(char transA,
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
		     MKL_INT ldc);

#endif 	    /* !LAPACK_WRAPPER_H_ */
