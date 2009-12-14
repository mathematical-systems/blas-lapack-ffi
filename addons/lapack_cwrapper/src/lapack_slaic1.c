/*
 * lapack_slaic1.c
 *
 *This program is a C interface to slaic1.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slaic1(const int job, const int j, const float * x, const float sest, const float * w, const float gamma, float * sestpr, float * s, float * c )
{
#ifdef F77_INT
	F77_INT F77_job=job, F77_j=j;
#else
	#define F77_job job
	#define F77_j j
#endif

	f77_slaic1(&F77_job, &F77_j, x, &sest, w, &gamma, sestpr, s, c);

#ifdef F77_INT
#endif

}
