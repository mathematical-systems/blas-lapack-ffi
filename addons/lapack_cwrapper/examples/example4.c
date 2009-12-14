#include <stddef.h>
#include <sys/time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include "cblas.h"
#include "../include/lapack.h"

int main(int argc, char **argv){

	int n, k, lda, ldb;
	double *A, *b, *Acopy, *bcopy;
	int *ipiv, info;
	int i;
	double t1,t2,elapsed;
	struct timeval tp;
	int rtn;
	double normr, normb;

	n = 1000; k = 2; lda = 1010; ldb=1020;

	A = (double *)malloc(2*lda*n*sizeof(double)) ;
	if (A==NULL){ printf("error of memory allocation\n"); exit(0); }
	Acopy = (double *)malloc(2*lda*n*sizeof(double)) ;
	if (Acopy==NULL){ printf("error of memory allocation\n"); exit(0); }
	b = (double *)malloc(2*ldb*k*sizeof(double)) ;
	if (b==NULL){ printf("error of memory allocation\n"); exit(0); }
	bcopy = (double *)malloc(2*ldb*k*sizeof(double)) ;
	if (bcopy==NULL){ printf("error of memory allocation\n"); exit(0); }
	ipiv = (int *)malloc(2*n*sizeof(int)) ;
	if (ipiv==NULL){ printf("error of memory allocation\n"); exit(0); }

	for(i=0;i<2*lda*n;i++)
		A[i] = ((double) rand()) / ((double) RAND_MAX) - 0.5;
	for(i=0;i<2*ldb*k;i++)
		b[i] = ((double) rand()) / ((double) RAND_MAX) - 0.5;

    cblas_dcopy(2*ldb*k,b,1,bcopy,1); 
    cblas_dcopy(2*lda*n,A,1,Acopy,1); 

	lapack_zgesv( n, k, A, lda, ipiv, b, ldb, &info); 


	double alpha[2];
	alpha[0]=1.0e0;
	alpha[1]=0.0e0;

	double beta[2];
	beta[0]=-1.0e0;
	beta[1]=0.0e0;
	
	normb = cblas_dnrm2(2*n,bcopy,1);
	cblas_zgemm ( CblasColMajor, CblasNoTrans, CblasNoTrans, n, k, n, alpha, Acopy, lda, b, ldb, beta, bcopy, ldb);
	normr = cblas_dnrm2(2*n,bcopy,1);
	printf("\tCGESV [n=%d,k=%d] \t(check:%e)\n",
		n,k,
		normr/normb);

	free(A);
	free(Acopy);
	free(b);
	free(bcopy);
	free(ipiv);

	exit(0);

}
