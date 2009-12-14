#include <stddef.h>
#include <sys/time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "cblas.h"
#include "../include/lapack.h"

int main(int argc, char **argv){

	int n, k, lda, ldb;
	float *A, *b, *Acopy, *bcopy;
	int *ipiv, info;
	int i;
	float t1,t2,elapsed;
	struct timeval tp;
	int rtn;
	float normr, normb;

	n = 1000; k = 2; lda = 1010; ldb=1020;

	A = (float *)malloc(lda*n*sizeof(float)) ;
	if (A==NULL){ printf("error of memory allocation\n"); exit(0); }
	Acopy = (float *)malloc(lda*n*sizeof(float)) ;
	if (Acopy==NULL){ printf("error of memory allocation\n"); exit(0); }
	b = (float *)malloc(ldb*k*sizeof(float)) ;
	if (b==NULL){ printf("error of memory allocation\n"); exit(0); }
	bcopy = (float *)malloc(ldb*k*sizeof(float)) ;
	if (bcopy==NULL){ printf("error of memory allocation\n"); exit(0); }
	ipiv = (int *)malloc(n*sizeof(int)) ;
	if (ipiv==NULL){ printf("error of memory allocation\n"); exit(0); }

	for(i=0;i<lda*n;i++)
		A[i] = ((float) rand()) / ((float) RAND_MAX) - 0.5;
	for(i=0;i<ldb*k;i++)
		b[i] = ((float) rand()) / ((float) RAND_MAX) - 0.5;

    cblas_scopy(ldb*k,b,1,bcopy,1); 
    cblas_scopy(lda*n,A,1,Acopy,1); 


	lapack_sgesv( n, k, A, lda, ipiv, b, ldb, &info); 

	normb = cblas_snrm2(n,bcopy,1);
	cblas_sgemm ( CblasColMajor, CblasNoTrans, CblasNoTrans, n, k, n, 1.0e0, Acopy, lda, b, ldb, -1.0e0, bcopy, ldb);
	normr = cblas_snrm2(n,bcopy,1);
	printf("\tSGESV [n=%d,k=%d] \t(check:%e)\n",
		n,k,
		normr/normb);

	free(A);
	free(Acopy);
	free(b);
	free(bcopy);
	free(ipiv);

	exit(0);

}
