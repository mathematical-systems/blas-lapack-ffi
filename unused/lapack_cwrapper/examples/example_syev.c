#include <stddef.h>
#include <sys/time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "cblas.h"
#include "../include/lapack.h"

int main(int argc, char **argv){


	printf("Computing dsyev...\n");
	
	int n, lda;
	double *A, *Acopy, *work, *w;
	int info, lwork;
	int i,j;
	double t1,t2,elapsed;
	struct timeval tp;
	int rtn;
	double normr, normb;

	n = 100; lda = 100;

	A = (double *)malloc(lda*n*sizeof(double)) ;
	if (A==NULL){ printf("error of memory allocation\n"); exit(0); }
	Acopy = (double *)malloc(lda*n*sizeof(double)) ;
	if (Acopy==NULL){ printf("error of memory allocation\n"); exit(0); }
	w=(double*)malloc(n*sizeof(double));
	
	for(i=0;i<lda*n;i++)
		A[i] = ((double) rand()) / ((double) RAND_MAX) - 0.5;
	for(i=0;i<n;i++)
	{
		for(j=0;j<n;j++)
			A[i+lda*j]=A[j+lda*i];
	}

    cblas_dcopy(lda*n,A,1,Acopy,1); 


	work=malloc(sizeof(double));
	lwork = -1;
	lapack_dsyev( lapack_compute_vectors, lapack_upper, n,  A, lda, w, work, lwork, &info); 

	lwork=work[0];
	free(work);
	work=malloc(lwork*sizeof(double));
	
	lapack_dsyev( lapack_compute_vectors, lapack_upper, n,  A, lda, w, work, lwork, &info); 
	
	double *tmp;
	tmp=(double*)malloc(n*lda*sizeof(double));
	for(i=0;i<lda*n;i++)
		tmp[i]=0;
	for(i=0;i<n;i++)
		tmp[i+lda*i]=1.0e0;
    cblas_dgemm ( CblasColMajor, CblasNoTrans, CblasTrans, n, n, n, 1.0e0, A, lda, A, lda, -1.0e0, tmp, lda);
	double ortho = 0.0e0;

	double* v;
	v=malloc(n*sizeof(double));
	double* x;
	x=malloc(n*sizeof(double));
	int* isgn;
	isgn=malloc(n*sizeof(int));
	double est;
	int kase;
	
	double *work_dlange;
	work_dlange=malloc(n*sizeof(double));
	ortho = lapack_dlange( lapack_one_norm, n, n, tmp, lda, work_dlange);
	free(work_dlange);
	printf("Orthogonality error : %e\n",ortho);


	for(i=0;i<lda*n;i++)
		tmp[i]=0;
	for(i=0;i<n;i++)
		tmp[i+lda*i]=w[i];

	double *tmp2;
	tmp2=(double*)malloc(n*lda*sizeof(double));
	
    cblas_dgemm ( CblasColMajor, CblasNoTrans, CblasNoTrans, n, n, n, 1.0e0, A, lda, tmp, lda, 0.0e0, tmp2, lda);

	for(i=0;i<lda*n;i++)
		tmp[i]=Acopy[i];

    cblas_dgemm ( CblasColMajor, CblasNoTrans, CblasTrans, n, n, n, -1.0e0, tmp2, lda, A, lda, 1.0e0, tmp, lda);

	double normA;
	work_dlange=malloc(n*sizeof(double));
	normA = lapack_dlange( lapack_one_norm, n, n, A, lda, work_dlange);
	free(work_dlange);

	double repr = 0.0e0;
	work_dlange=malloc(n*sizeof(double));
	repr = lapack_dlange( lapack_one_norm, n, n, tmp, lda, work_dlange);
	free(work_dlange);

	printf("Reprentativity error : %e\n",repr);

	free(A);
	free(Acopy);
	free(work);
	free(tmp);
	free(tmp2);

	printf("*******************************************************\n");



	printf("Computing zheev...\n");
	

	n = 300; lda = 300;

	A = (double *)malloc(2*lda*n*sizeof(double)) ;
	if (A==NULL){ printf("error of memory allocation\n"); exit(0); }
	Acopy = (double *)malloc(2*lda*n*sizeof(double)) ;
	if (Acopy==NULL){ printf("error of memory allocation\n"); exit(0); }
	w=(double*)malloc(n*sizeof(double));

	for(i=0;i<2*lda*n;i++)
		A[i] = ((double) rand()) / ((double) RAND_MAX) - 0.5;

	for (i=0;i<n;i++)
		for (j=0;j<n;j++)
		{
			A[2*(i+lda*j)+1] = -A[2*(j+lda*i)+1];
			A[2*(i+lda*j)]   = A[2*(j+lda*i)];
		}

	for (i=0;i<n;i++)
		A[2*(i+lda*i)+1]=0;

	cblas_zcopy(lda*n,A,1,Acopy,1); 

	double *rwork;
	rwork=malloc((3*n-2)*sizeof(double));
	
	work=malloc(2*sizeof(double));
	lwork = -1;
	lapack_zheev( lapack_compute_vectors, lapack_upper, n,  A, lda, w, work, lwork, rwork, &info); 

	lwork=work[0];
	free(work);
	work=malloc(2*lwork*sizeof(double));
	
	lapack_zheev( lapack_compute_vectors, lapack_upper, n,  A, lda, w, work, lwork, rwork, &info); 

	tmp=(double*)malloc(2*n*lda*sizeof(double));
	double alpha[2];
	double beta[2];
	tmp2=(double*)malloc(2*n*lda*sizeof(double));
	alpha[0]=1.0e0;
	alpha[1]=0.0e0;
	beta[0]=-1.0e0;
	beta[1]=0.0e0;

	for (i=0;i<2*n*lda;i++)
		tmp[i]=0;
	for (i=0;i<n;i++)
		tmp[2*(i+lda*i)]=1;	
    cblas_zgemm ( CblasColMajor, CblasNoTrans, CblasConjTrans, n, n, n, alpha, A, lda, A, lda, beta, tmp, lda);


	
	ortho=cblas_dnrm2(2*n*n,tmp,1);
	
	printf("Orthogonality error : %e\n",ortho);
	

	for (i=0;i<n;i++)
	{
		for (j=0;j<n;j++)
		{
			tmp[2*(i+lda*j)]=A[2*(i+lda*j)]*w[j];
			tmp[2*(i+lda*j)+1]=A[2*(i+lda*j)+1]*w[j];
		}
	}
	
	cblas_zcopy(lda*n,Acopy,1,tmp2,1); 
    cblas_zgemm ( CblasColMajor, CblasNoTrans, CblasConjTrans, n, n, n, alpha, tmp, lda, A, lda, beta, tmp2, lda);

	repr=cblas_dnrm2(2*n*n,tmp2,1);
			
	printf("Reprentativity error : %e\n",repr);

	free(A);
	free(Acopy);
	free(work);
	free(tmp);
	free(tmp2);

	exit(0);

}
